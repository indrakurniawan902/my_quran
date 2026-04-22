import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_quran/common/failure.dart';
import 'package:my_quran/data/datasources/remote/auth/auth_datasource.dart';

import 'package:flutter/services.dart';

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
    } on PlatformException catch (e) {
      if (e.code == 'network_error' || e.message?.contains('7:') == true) {
        return const Left(ConnectionFailure('Network error. Please check your internet connection.'));
      }
      return Left(ServerFailure("Error signing in: ${e.message}"));
    } catch (e) {
      return Left(ServerFailure("Error signing in: ${e.toString()}"));
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
