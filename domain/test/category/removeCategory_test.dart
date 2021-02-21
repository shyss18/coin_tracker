import 'package:dartz/dartz.dart';
import 'package:domain/contracts/repositories/categoryRepository.dart';
import 'package:domain/entities/category.dart';
import 'package:domain/usecases/category/removeCategory.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockCategoryRepository extends Mock implements CategoryRepository {}

void main() {
  RemoveCategory _removeCategoryUseCase;
  MockCategoryRepository _mockCategoryRepository;

  setUp(() {
    _mockCategoryRepository = MockCategoryRepository();
    _removeCategoryUseCase =
        RemoveCategory(categoryRepository: _mockCategoryRepository);
  });

  final category = Category(categoryColor: 'color', categoryTitle: 'title');

  test('Should return true if category deleted.', () async {
    // arrange
    when(_mockCategoryRepository.removeCategory(any))
        .thenAnswer((_) async => Right(true));

    // act
    final result =
        await _removeCategoryUseCase(Params(currentCategory: category));

    // assert
    expect(result, Right(true));
    verify(_mockCategoryRepository.removeCategory(any));
    verifyNoMoreInteractions(_mockCategoryRepository);
  });
}
