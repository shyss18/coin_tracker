import 'package:dartz/dartz.dart';
import 'package:domain/contracts/repositories/currencyRepository.dart';
import 'package:domain/entities/currency.dart';
import 'package:domain/usecases/currency/getCurrencyByTitle.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockCurrencyRepository extends Mock implements CurrencyRepository {}

void main() {
  GetCurrencyByTitle _getCurrencyByTitleUseCase;
  MockCurrencyRepository _mockCurrencyRepository;

  setUp(() {
    _mockCurrencyRepository = MockCurrencyRepository();
    _getCurrencyByTitleUseCase =
        GetCurrencyByTitle(currencyRepository: _mockCurrencyRepository);
  });

  final currencyTitle = 'someTitle';
  final returnedCurrency = Currency(currencyTitle: 'someTitle');

  test('Should return some currency model by title.', () async {
    // arrange
    when(_mockCurrencyRepository.getCurrencyByTitle(any))
        .thenAnswer((_) async => Right(returnedCurrency));

    // act
    final result =
        await _getCurrencyByTitleUseCase(Params(currencyTitle: currencyTitle));

    // assert
    expect(result, Right(returnedCurrency));
    verify(_mockCurrencyRepository.getCurrencyByTitle(any));
    verifyNoMoreInteractions(_mockCurrencyRepository);
  });
}
