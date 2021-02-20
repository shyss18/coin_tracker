import 'package:dartz/dartz.dart';
import 'package:domain/contracts/repositories/categoryRepository.dart';
import 'package:domain/entities/category.dart';
import 'package:domain/errors/failures.dart';
import 'package:domain/usecases/UseCase.dart';
import 'package:equatable/equatable.dart';

class CreateCategory extends UseCase<Category, Params> {
  CreateCategory({this.categoryRepository});

  final CategoryRepository categoryRepository;

  @override
  Future<Either<Failure, Category>> call(Params params) async {
    final result = await categoryRepository.createCategory(params.newCategory);
    return result.fold(
        (failure) => Left(failure), (category) => Right(category));
  }
}

class Params extends Equatable {
  Params({this.newCategory});

  final Category newCategory;

  @override
  List<Object> get props => [newCategory];
}
