import 'package:dartz/dartz.dart';
import 'package:domain/contracts/repositories/transactionRepository.dart';
import 'package:domain/contracts/services/dateService.dart';
import 'package:domain/entities/transaction.dart';
import 'package:domain/errors/failures.dart';
import 'package:domain/usecases/useCase.dart';

class GetTransactionsForLastWeek extends UseCase<IList<Transaction>, NoParams> {
  GetTransactionsForLastWeek({this.transactionRepository, this.dateService});

  final TransactionRepository transactionRepository;
  final DateService dateService;

  @override
  Future<Either<Failure, IList<Transaction>>> call(NoParams params) async {
    final result = await transactionRepository.filterTransactions(
        (transaction) => dateService.isDatesInTheSameWeek(
            transaction.transactionTime, DateTime.now()));
    return result.fold(
        (failure) => Left(failure), (transactions) => Right(transactions));
  }
}
