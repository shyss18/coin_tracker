import 'package:dartz/dartz.dart';
import 'package:domain/contracts/repositories/categoryRepository.dart';
import 'package:domain/entities/category.dart';
import 'package:domain/usecases/category/getExistingCategories.dart';
import 'package:domain/usecases/useCase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockCategoryRepository extends Mock implements CategoryRepository {}

void main() {
  GetExistingCategories _getExistingCategoriesUseCase;
  MockCategoryRepository _mockCategoryRepository;

  setUp(() {
    _mockCategoryRepository = MockCategoryRepository();
    _getExistingCategoriesUseCase =
        GetExistingCategories(categoryRepository: _mockCategoryRepository);
  });

  final existingCategories = IList.from([
    Category(categoryColor: 'color1', categoryTitle: 'title1'),
    Category(categoryColor: 'color2', categoryTitle: 'title2')
  ]);

  test('Should return all existing categories.', () async {
    // arrange
    when(_mockCategoryRepository.getAllCategories())
        .thenAnswer((_) async => Right(existingCategories));

    // act
    final result = await _getExistingCategoriesUseCase(NoParams());

    // assert
    expect(result, Right(existingCategories));
    verify(_mockCategoryRepository.getAllCategories());
    verifyNoMoreInteractions(_mockCategoryRepository);
  });
}
