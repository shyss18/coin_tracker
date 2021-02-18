import 'package:dartz/dartz.dart';

import '../errors/failures.dart';
import '../entities/transaction.dart';

abstract class TransactionRepository {
  Future<Either<Failure, IList<Transaction>>> getAllTransactions();
  Future<Either<Failure, IList<Transaction>>> filterTransactions(
      bool test(Transaction element));

  Future<Either<Failure, Transaction>> createTransaction(
      Transaction newTransaction);
}
