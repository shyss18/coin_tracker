import 'package:dartz/dartz.dart';
import 'package:domain/contracts/repositories/userRepository.dart';
import 'package:domain/entities/user.dart';
import 'package:domain/usecases/UseCase.dart';
import 'package:domain/usecases/user/getUserFirstLaunchStatus.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockUserRepository extends Mock implements UserRepository {}

void main() {
  MockUserRepository _mockUserRepository;
  GetUserFirstLaunchStatus _getUserFirstLaunchStatusUseCase;

  setUp(() {
    _mockUserRepository = MockUserRepository();
    _getUserFirstLaunchStatusUseCase =
        GetUserFirstLaunchStatus(userRepository: _mockUserRepository);
  });

  final user = User(isFirstLaunch: true);

  test('Should return true if user launch application at first time.',
      () async {
    // arrange
    when(_mockUserRepository.getCurrentUser())
        .thenAnswer((_) async => Right(user));
    // act
    final result = await _getUserFirstLaunchStatusUseCase(NoParams());

    // assert
    expect(result, Right(true));
    verify(_mockUserRepository.getCurrentUser());
    verifyNoMoreInteractions(_mockUserRepository);
  });
}
