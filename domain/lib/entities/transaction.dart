import 'package:domain/entities/category.dart';
import 'package:domain/entities/currency.dart';
import 'package:equatable/equatable.dart';

class Transaction extends Equatable {
  const Transaction(
      {this.category,
      this.transactionKind,
      this.moneySpent,
      this.place,
      this.currency});

  final Category category;
  final String transactionKind;
  final String place;
  final String moneySpent;
  final Currency currency;

  @override
  List<Object> get props =>
      [category, transactionKind, place, moneySpent, currency];
}
