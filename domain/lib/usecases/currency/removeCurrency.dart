import 'package:dartz/dartz.dart';
import 'package:domain/contracts/repositories/currencyRepository.dart';
import 'package:domain/entities/currency.dart';
import 'package:domain/errors/failures.dart';
import 'package:equatable/equatable.dart';
import '../UseCase.dart';

class RemoveCurrency extends UseCase<bool, Params> {
  RemoveCurrency({this.currencyRepository});

  final CurrencyRepository currencyRepository;

  @override
  Future<Either<Failure, bool>> call(Params params) async {
    final result =
        await currencyRepository.removeCurrency(params.currentCurrency);
    return result.fold(
        (failure) => Left(failure), (isRemoved) => Right(isRemoved));
  }
}

class Params extends Equatable {
  Params({this.currentCurrency});

  final Currency currentCurrency;

  @override
  List<Object> get props => [currentCurrency];
}
