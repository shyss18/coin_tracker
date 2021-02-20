import 'package:dartz/dartz.dart';

import '../../errors/failures.dart';
import '../../entities/user.dart';

abstract class UserRepository {
  Future<Either<Failure, User>> getCurrentUser();
}
