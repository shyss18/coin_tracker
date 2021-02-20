import 'package:dartz/dartz.dart';
import 'package:domain/contracts/repositories/currencyRepository.dart';
import 'package:domain/entities/currency.dart';
import 'package:domain/errors/failures.dart';
import 'package:domain/usecases/useCase.dart';

class GetExistingCurrencies extends UseCase<IList<Currency>, NoParams> {
  GetExistingCurrencies({this.currencyRepository});

  final CurrencyRepository currencyRepository;

  @override
  Future<Either<Failure, IList<Currency>>> call(NoParams params) async {
    final result = await currencyRepository.getAllCurrencies();
    return result.fold(
        (failure) => Left(failure), (currencies) => Right(currencies));
  }
}
