import 'package:dartz/dartz.dart';
import 'package:my_quran/common/failure.dart';

abstract class AuthRepository {
  Future<Either<Failure, String>> signinWithGoogle();
  Future<Either<Failure, bool>> isLogginWithGoogle();
  Future<Either<Failure, void>> signout();
}
