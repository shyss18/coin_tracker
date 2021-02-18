import 'package:equatable/equatable.dart';

class User extends Equatable {
  const User({this.isFirstLaunch});

  final bool isFirstLaunch;

  @override
  List<Object> get props => [isFirstLaunch];
}
