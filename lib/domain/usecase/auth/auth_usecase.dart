import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:my_quran/domain/repositories/auth/auth_repository.dart';

import '../../../common/failure.dart';

@lazySingleton
class AuthUsecase {
  final AuthRepository authRepository;

  AuthUsecase({required this.authRepository});

  Future<Either<Failure, UserCredential>> call() {
    return authRepository.signinWithGoogle();
  }
}
