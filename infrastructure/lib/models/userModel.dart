import 'package:domain/entities/user.dart';
import 'package:hive/hive.dart';
import 'package:infrastructure/models/modelTypes.dart';

@HiveType(typeId: ModelTypes.UserType)
class UserModel extends User {
  @HiveField(0)
  bool isFirstLaunch;

  UserModel({this.isFirstLaunch}) : super(isFirstLaunch: isFirstLaunch);
}
