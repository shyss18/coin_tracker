import 'package:dartz/dartz.dart';
import 'package:domain/contracts/repositories/currencyRepository.dart';
import 'package:domain/entities/currency.dart';
import 'package:domain/usecases/currency/getExistingCurrencies.dart';
import 'package:domain/usecases/useCase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockCurrencyRepository extends Mock implements CurrencyRepository {}

void main() {
  GetExistingCurrencies _getExistingCurrenciesUseCase;
  MockCurrencyRepository _mockCurrencyRepository;

  setUp(() {
    _mockCurrencyRepository = MockCurrencyRepository();
    _getExistingCurrenciesUseCase =
        GetExistingCurrencies(currencyRepository: _mockCurrencyRepository);
  });

  final existingCurrencies = IList.from(
      [Currency(currencyTitle: 'title1'), Currency(currencyTitle: 'title2')]);

  test('Should return all existing currencies.', () async {
    // arrange
    when(_mockCurrencyRepository.getAllCurrencies())
        .thenAnswer((_) async => Right(existingCurrencies));

    // act
    final result = await _getExistingCurrenciesUseCase(NoParams());

    // assert
    expect(result, Right(existingCurrencies));
    verify(_mockCurrencyRepository.getAllCurrencies());
    verifyNoMoreInteractions(_mockCurrencyRepository);
  });
}
