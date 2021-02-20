import 'package:dartz/dartz.dart';
import 'package:domain/contracts/repositories/categoryRepository.dart';
import 'package:domain/entities/category.dart';
import 'package:domain/errors/failures.dart';
import 'package:domain/usecases/useCase.dart';
import 'package:equatable/equatable.dart';

class GetCategoryByTitle extends UseCase<Category, Params> {
  GetCategoryByTitle({this.categoryRepository});

  final CategoryRepository categoryRepository;

  @override
  Future<Either<Failure, Category>> call(Params params) async {
    final result =
        await categoryRepository.getCategoryByTitle(params.categoryTitle);
    return result.fold(
        (failure) => Left(failure), (category) => Right(category));
  }
}

class Params extends Equatable {
  Params({this.categoryTitle});

  final String categoryTitle;

  @override
  List<Object> get props => [categoryTitle];
}
