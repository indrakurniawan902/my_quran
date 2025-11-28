import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:my_quran/common/exception.dart';

abstract class AuthDataSource {
  Future<String> signinWithGoogle();
  Future<bool> isLogginWithGoogle();
  Future<void> signoutWithGoogle();
}

@LazySingleton(as: AuthDataSource)
class AuthDataSourceImpl implements AuthDataSource {
  final FirebaseAuth auth;

  AuthDataSourceImpl(this.auth);

  @override
  Future<String> signinWithGoogle() async {
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();
    if (gUser == null) {
      throw ServerException();
    }

    final GoogleSignInAuthentication gAuth = await gUser.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );
    await auth.signInWithCredential(credential);

    return "success login";
  }

  @override
  Future<bool> isLogginWithGoogle() async {
    final bool isUserLogin = auth.currentUser != null;
    return isUserLogin;
  }

  @override
  Future<void> signoutWithGoogle() async {
    await auth.signOut();
  }
}
