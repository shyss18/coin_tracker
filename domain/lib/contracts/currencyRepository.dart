import 'package:dartz/dartz.dart';

import '../errors/failures.dart';
import '../entities/currency.dart';

abstract class CurrencyRepository {
  Future<Either<Failure, Currency>> getCurrencyByTitle(String currencyTitle);
  Future<Either<Failure, IList<Currency>>> getAllCurrencies();

  Future<Either<Failure, Currency>> createCurrency(Currency newCurrency);
  Future<Either<Failure, Currency>> changeCurrency(Currency currentCurrency);
}
