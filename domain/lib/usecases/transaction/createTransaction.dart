import 'package:dartz/dartz.dart';
import 'package:domain/contracts/repositories/transactionRepository.dart';
import 'package:domain/entities/transaction.dart';
import 'package:domain/errors/failures.dart';
import 'package:equatable/equatable.dart';

import '../UseCase.dart';

class CreateTransaction extends UseCase<Transaction, Params> {
  CreateTransaction({this.transactionRepository});

  final TransactionRepository transactionRepository;

  @override
  Future<Either<Failure, Transaction>> call(Params params) async {
    final result =
        await transactionRepository.createTransaction(params.newTransaction);
    return result.fold(
        (failure) => Left(failure), (transaction) => Right(transaction));
  }
}

class Params extends Equatable {
  Params({this.newTransaction});

  final Transaction newTransaction;

  @override
  List<Object> get props => [newTransaction];
}
