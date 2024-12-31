import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_quran/domain/repositories/auth/auth_repository.dart';

import '../../../common/failure.dart';

@lazySingleton
class LoginGoogleUseCase {
  final AuthRepository authRepository;

  LoginGoogleUseCase({required this.authRepository});

  Future<Either<Failure, String>> call() {
    return authRepository.signinWithGoogle();
  }
}
