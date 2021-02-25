import 'package:dartz/dartz.dart';
import 'package:domain/entities/currency.dart';
import 'package:domain/errors/failures.dart';

import 'package:domain/contracts/repositories/currencyRepository.dart';

class CurrencyRepositoryImpl implements CurrencyRepository {
  @override
  Future<Either<Failure, Currency>> changeCurrency(Currency currentCurrency) {
    // TODO: implement changeCurrency
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Currency>> createCurrency(Currency newCurrency) {
    // TODO: implement createCurrency
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, IList<Currency>>> getAllCurrencies() {
    // TODO: implement getAllCurrencies
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Currency>> getCurrencyByTitle(String currencyTitle) {
    // TODO: implement getCurrencyByTitle
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, bool>> removeCurrency(Currency currentCurrency) {
    // TODO: implement removeCurrency
    throw UnimplementedError();
  }
}
