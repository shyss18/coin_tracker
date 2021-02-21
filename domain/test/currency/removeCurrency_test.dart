import 'package:dartz/dartz.dart';
import 'package:domain/contracts/repositories/currencyRepository.dart';
import 'package:domain/entities/currency.dart';
import 'package:domain/usecases/currency/removeCurrency.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockCurrencyRepository extends Mock implements CurrencyRepository {}

void main() {
  RemoveCurrency _removeCurrencyUseCase;
  MockCurrencyRepository _mockCurrencyRepository;

  setUp(() {
    _mockCurrencyRepository = MockCurrencyRepository();
    _removeCurrencyUseCase =
        RemoveCurrency(currencyRepository: _mockCurrencyRepository);
  });

  final currency = Currency(currencyTitle: 'title');

  test('Should return true if currency deleted.', () async {
    // arrange
    when(_mockCurrencyRepository.removeCurrency(any))
        .thenAnswer((_) async => Right(true));

    // act
    final result =
        await _removeCurrencyUseCase(Params(currentCurrency: currency));

    // assert
    expect(result, Right(true));
    verify(_mockCurrencyRepository.removeCurrency(any));
    verifyNoMoreInteractions(_mockCurrencyRepository);
  });
}
