import 'package:domain/entities/transaction.dart';
import 'package:hive/hive.dart';
import 'package:infrastructure/models/categoryModel.dart';
import 'package:infrastructure/models/currencyModel.dart';
import 'package:infrastructure/models/modelTypes.dart';

@HiveType(typeId: ModelTypes.TransactionType)
class TransactionModel extends Transaction {
  @HiveField(0)
  CategoryModel categoryModel;
  
  @HiveField(1)
  CurrencyModel currencyModel;
  
  @HiveField(2)
  String moneySpent;
  
  @HiveField(3)
  String place;
  
  @HiveField(4)
  String transactionKind;
  
  @HiveField(5)
  DateTime transactionTime;

  TransactionModel(
      {this.categoryModel,
      this.currencyModel,
      this.moneySpent,
      this.place,
      this.transactionKind,
      this.transactionTime})
      : super(
            category: categoryModel,
            currency: currencyModel,
            moneySpent: moneySpent,
            place: place,
            transactionKind: transactionKind,
            transactionTime: transactionTime);
}
