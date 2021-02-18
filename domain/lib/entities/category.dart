import 'package:equatable/equatable.dart';

class Category extends Equatable {
  const Category({this.categoryTitle, this.categoryColor});

  final String categoryTitle;
  final String categoryColor;

  @override
  List<Object> get props => [categoryTitle, categoryColor];
}
