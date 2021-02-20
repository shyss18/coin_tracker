import 'package:dartz/dartz.dart';
import 'package:domain/contracts/repositories/userRepository.dart';
import 'package:domain/usecases/UseCase.dart';

import '../../errors/failures.dart';

class GetUserFirstLaunchStatus extends UseCase<bool, NoParams> {
  GetUserFirstLaunchStatus({this.userRepository});

  final UserRepository userRepository;

  @override
  Future<Either<Failure, bool>> call(NoParams params) async {
    final result = await userRepository.getCurrentUser();
    return result.fold((failure) => Left(failure),
        (currentUser) => Right(currentUser.isFirstLaunch));
  }
}
