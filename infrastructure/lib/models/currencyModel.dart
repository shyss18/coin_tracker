import 'package:domain/entities/currency.dart';
import 'package:hive/hive.dart';
import 'package:infrastructure/models/modelTypes.dart';

@HiveType(typeId: ModelTypes.CurrencyType)
class CurrencyModel extends Currency {
  
  @HiveField(0)
  String title;

  CurrencyModel({this.title}) : super(currencyTitle: title);
}
