import 'package:domain/entities/category.dart';
import 'package:domain/entities/currency.dart';
import 'package:domain/entities/transaction.dart';

class TransactionModel extends Transaction {
  const TransactionModel(
      {Category category,
      Currency currency,
      String moneySpent,
      String place,
      String transactionKind,
      DateTime transactionTime})
      : super(
            category: category,
            currency: currency,
            moneySpent: moneySpent,
            place: place,
            transactionKind: transactionKind,
            transactionTime: transactionTime);
}
