import 'package:dartz/dartz.dart';
import 'package:domain/errors/failures.dart';

import 'package:domain/entities/transaction.dart';
import 'package:domain/contracts/repositories/transactionRepository.dart';

class TransactionRepositoryImpl implements TransactionRepository {
  @override
  Future<Either<Failure, Transaction>> createTransaction(
      Transaction newTransaction) {
    // TODO: implement createTransaction
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, IList<Transaction>>> filterTransactions(
      bool Function(Transaction element)) {
    // TODO: implement filterTransactions
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, IList<Transaction>>> getAllTransactions() {
    // TODO: implement getAllTransactions
    throw UnimplementedError();
  }
}
