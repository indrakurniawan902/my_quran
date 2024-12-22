import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_quran/common/failure.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserCredential>> signinWithGoogle();
}
