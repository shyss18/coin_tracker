import 'package:dartz/dartz.dart';
import 'package:domain/contracts/repositories/categoryRepository.dart';
import 'package:domain/entities/category.dart';
import 'package:domain/errors/failures.dart';
import 'package:domain/usecases/UseCase.dart';
import 'package:equatable/equatable.dart';

class RemoveCategory extends UseCase<bool, Params> {
  RemoveCategory({this.categoryRepository});

  final CategoryRepository categoryRepository;

  @override
  Future<Either<Failure, bool>> call(Params params) async {
    final result =
        await categoryRepository.removeCategory(params.currentCategory);
    return result.fold(
        (failure) => Left(failure), (isRemoved) => Right(isRemoved));
  }
}

class Params extends Equatable {
  Params({this.currentCategory});

  final Category currentCategory;

  @override
  List<Object> get props => [currentCategory];
}
