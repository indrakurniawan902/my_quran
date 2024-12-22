import 'package:dartz/dartz.dart';
import 'package:my_quran/common/failure.dart';

abstract class AuthRepository {
  Future<Either<Failure, String>> signinWithGoogle();
}
