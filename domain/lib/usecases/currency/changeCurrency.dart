import 'package:dartz/dartz.dart';
import 'package:domain/contracts/repositories/currencyRepository.dart';
import 'package:domain/entities/currency.dart';
import 'package:domain/errors/failures.dart';
import 'package:equatable/equatable.dart';
import '../UseCase.dart';

class ChangeCurrency extends UseCase<Currency, Params> {
  ChangeCurrency({this.currencyRepository});

  final CurrencyRepository currencyRepository;

  @override
  Future<Either<Failure, Currency>> call(Params params) async {
    final result =
        await currencyRepository.changeCurrency(params.currentCurrency);
    return result.fold(
        (failure) => Left(failure), (currency) => Right(currency));
  }
}

class Params extends Equatable {
  Params({this.currentCurrency});

  final Currency currentCurrency;

  @override
  List<Object> get props => [currentCurrency];
}
