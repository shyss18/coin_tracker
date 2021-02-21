import 'package:dartz/dartz.dart';
import 'package:domain/contracts/repositories/categoryRepository.dart';
import 'package:domain/entities/category.dart';
import 'package:domain/usecases/category/createCategory.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockCategoryRepository extends Mock implements CategoryRepository {}

void main() {
  CreateCategory _createCategoryUseCase;
  MockCategoryRepository _mockCategoryRepository;

  setUp(() {
    _mockCategoryRepository = MockCategoryRepository();
    _createCategoryUseCase =
        CreateCategory(categoryRepository: _mockCategoryRepository);
  });

  final newCategory =
      Category(categoryColor: 'newColor', categoryTitle: 'newTitle');

  test('Should return created category model.', () async {
    // arrange
    when(_mockCategoryRepository.createCategory(any))
        .thenAnswer((_) async => Right(newCategory));

    // act
    final result =
        await _createCategoryUseCase(Params(newCategory: newCategory));

    // assert
    expect(result, Right(newCategory));
    verify(_mockCategoryRepository.createCategory(any));
    verifyNoMoreInteractions(_mockCategoryRepository);
  });
}
