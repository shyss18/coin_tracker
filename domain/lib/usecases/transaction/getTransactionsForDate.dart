import 'package:dartz/dartz.dart';
import 'package:domain/contracts/repositories/transactionRepository.dart';
import 'package:domain/contracts/services/dateService.dart';
import 'package:domain/entities/transaction.dart';
import 'package:domain/errors/failures.dart';
import 'package:equatable/equatable.dart';

import '../UseCase.dart';

class GetTransactionsForDate extends UseCase<IList<Transaction>, Params> {
  GetTransactionsForDate({this.transactionRepository, this.dateService});

  final TransactionRepository transactionRepository;
  final DateService dateService;

  @override
  Future<Either<Failure, IList<Transaction>>> call(Params params) async {
    final result = await transactionRepository.filterTransactions(
        (transaction) => dateService.isDatesEquals(
            transaction.transactionTime, params.date));
    return result.fold(
        (failure) => Left(failure), (transactions) => Right(transactions));
  }
}

class Params extends Equatable {
  Params({this.date});

  final DateTime date;

  @override
  List<Object> get props => [date];
}
