import 'package:dartz/dartz.dart';
import 'package:domain/errors/failures.dart';

import 'package:domain/contracts/repositories/userRepository.dart';
import 'package:domain/entities/user.dart';

class UserRepositoryImpl implements UserRepository {
  @override
  Future<Either<Failure, User>> getCurrentUser() {
    // TODO: implement getCurrentUser
    throw UnimplementedError();
  }
}
