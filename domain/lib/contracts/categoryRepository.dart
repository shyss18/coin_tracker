import 'package:dartz/dartz.dart';

import '../errors/failures.dart';
import '../entities/category.dart';

abstract class CategoryRepository {
  Future<Either<Failure, Category>> getCategoryByTitle(String categoryTitle);
  Future<Either<Failure, IList<Category>>> getAllCategories();

  Future<Either<Failure, Category>> createCategory(Category newCategory);
  Future<Either<Failure, Category>> changeCategory(Category currentCategory);
}
