import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_quran/common/failure.dart';
import 'package:my_quran/data/datasources/remote/auth/auth_datasource.dart';

import '../../common/exception.dart';
import '../../domain/repositories/auth/auth_repository.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource authDataSource;

  AuthRepositoryImpl({required this.authDataSource});

  @override
  Future<Either<Failure, String>> signinWithGoogle() async {
    try {
      final result = await authDataSource.signinWithGoogle();
      return Right(result);
    } on ServerException {
      return const Left(ServerFailure(''));
    } catch (e) {
      return const Left(ServerFailure("Error signing in"));
    }
  }

  @override
  Future<Either<Failure, bool>> isLogginWithGoogle() async {
    try {
      final result = await authDataSource.isLogginWithGoogle();
      return Right(result);
    } catch (e) {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, void>> signout() async {
    try {
      await authDataSource.signoutWithGoogle();
      return const Right(null);
    } catch (e) {
      return const Left(ServerFailure('Failed to sign out from the network'));
    }
  }
}
