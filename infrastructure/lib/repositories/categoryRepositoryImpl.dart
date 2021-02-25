import 'package:dartz/dartz.dart';
import 'package:domain/errors/failures.dart';

import 'package:domain/contracts/repositories/categoryRepository.dart';
import 'package:domain/entities/category.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  @override
  Future<Either<Failure, Category>> changeCategory(Category currentCategory) {
    // TODO: implement changeCategory
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Category>> createCategory(Category newCategory) {
    // TODO: implement createCategory
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, IList<Category>>> getAllCategories() {
    // TODO: implement getAllCategories
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Category>> getCategoryByTitle(String categoryTitle) {
    // TODO: implement getCategoryByTitle
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, bool>> removeCategory(Category currentCategory) {
    // TODO: implement removeCategory
    throw UnimplementedError();
  }
}
