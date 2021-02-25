import 'package:domain/entities/category.dart';
import 'package:hive/hive.dart';
import 'package:infrastructure/models/modelTypes.dart';

@HiveType(typeId: ModelTypes.CategoryType)
class CategoryModel extends Category {
  @HiveField(0)
  String color;

  @HiveField(1)
  String title;

  CategoryModel({this.color, this.title})
      : super(categoryColor: color, categoryTitle: title);
}
