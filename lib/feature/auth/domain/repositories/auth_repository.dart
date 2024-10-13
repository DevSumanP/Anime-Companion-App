import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/core/error/failure.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, String>> signInWithEmailPassword({
    required String email,
    required String password,
  });

  Future<Either<Failure, String>> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
  });
}
