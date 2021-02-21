import 'package:dartz/dartz.dart';
import 'package:domain/contracts/repositories/currencyRepository.dart';
import 'package:domain/entities/currency.dart';
import 'package:domain/usecases/currency/changeCurrency.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockCurrencyRepository extends Mock implements CurrencyRepository {}

void main() {
  ChangeCurrency _changeCurrencyUseCase;
  MockCurrencyRepository _mockCurrencyRepository;

  setUp(() {
    _mockCurrencyRepository = MockCurrencyRepository();
    _changeCurrencyUseCase =
        ChangeCurrency(currencyRepository: _mockCurrencyRepository);
  });

  final unchangedCurrency = Currency(currencyTitle: 'someTitle');
  final changedCurrency = Currency(currencyTitle: 'changeTitle');

  test('Should return changed currency model.', () async {
    // arrange
    when(_mockCurrencyRepository.changeCurrency(any))
        .thenAnswer((_) async => Right(changedCurrency));

    // act
    final result = await _changeCurrencyUseCase(
        Params(currentCurrency: unchangedCurrency));

    // assert
    expect(result, Right(changedCurrency));
    verify(_mockCurrencyRepository.changeCurrency(any));
    verifyNoMoreInteractions(_mockCurrencyRepository);
  });
}
