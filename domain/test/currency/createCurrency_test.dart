import 'package:dartz/dartz.dart';
import 'package:domain/contracts/repositories/currencyRepository.dart';
import 'package:domain/entities/currency.dart';
import 'package:domain/usecases/currency/createCurrency.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockCurrencyRepository extends Mock implements CurrencyRepository {}

void main() {
  CreateCurrency _createCurrencyUseCase;
  MockCurrencyRepository _mockCurrencyRepository;

  setUp(() {
    _mockCurrencyRepository = MockCurrencyRepository();
    _createCurrencyUseCase =
        CreateCurrency(currencyRepository: _mockCurrencyRepository);
  });

  final newCurrency = Currency(currencyTitle: 'title');

  test('Should return created currency model.', () async {
    // arrange
    when(_mockCurrencyRepository.createCurrency(any))
        .thenAnswer((_) async => Right(newCurrency));

    // act
    final result =
        await _createCurrencyUseCase(Params(newCurrency: newCurrency));

    // assert
    expect(result, Right(newCurrency));
    verify(_mockCurrencyRepository.createCurrency(any));
    verifyNoMoreInteractions(_mockCurrencyRepository);
  });
}
