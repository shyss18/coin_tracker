import 'package:equatable/equatable.dart';

class Currency extends Equatable {
  const Currency({this.currencyTitle});

  final String currencyTitle;

  @override
  List<Object> get props => [currencyTitle];
}
