import 'package:dartz/dartz.dart';
import 'package:domain/contracts/repositories/categoryRepository.dart';
import 'package:domain/entities/category.dart';
import 'package:domain/errors/failures.dart';
import 'package:domain/usecases/useCase.dart';

class GetExistingCategories extends UseCase<IList<Category>, NoParams> {
  GetExistingCategories({this.categoryRepository});

  final CategoryRepository categoryRepository;

  @override
  Future<Either<Failure, IList<Category>>> call(NoParams params) async {
    final result = await categoryRepository.getAllCategories();
    return result.fold(
        (failure) => Left(failure), (categories) => Right(categories));
  }
}
