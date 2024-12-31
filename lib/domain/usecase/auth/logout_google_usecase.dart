import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_quran/domain/repositories/auth/auth_repository.dart';

import '../../../common/failure.dart';

@lazySingleton
class LogoutGoogleUseCase {
  final AuthRepository authRepository;

  LogoutGoogleUseCase({required this.authRepository});

  Future<Either<Failure, void>> call() {
    return authRepository.signout();
  }
}
