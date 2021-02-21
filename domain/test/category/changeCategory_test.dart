import 'package:dartz/dartz.dart';
import 'package:domain/contracts/repositories/categoryRepository.dart';
import 'package:domain/entities/category.dart';
import 'package:domain/usecases/category/changeCategory.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockCategoryRepository extends Mock implements CategoryRepository {}

void main() {
  ChangeCategory _changeCategoryUseCase;
  MockCategoryRepository _mockCategoryRepository;

  setUp(() {
    _mockCategoryRepository = MockCategoryRepository();
    _changeCategoryUseCase =
        ChangeCategory(categoryRepository: _mockCategoryRepository);
  });

  final unchangedCategory =
      Category(categoryColor: 'someColor', categoryTitle: 'someTitle');
  final changedCategory =
      Category(categoryColor: 'changedColor', categoryTitle: 'changedTitle');

  test('Should return changed category model.', () async {
    // arrange
    when(_mockCategoryRepository.changeCategory(any))
        .thenAnswer((_) async => Right(changedCategory));

    // act
    final result = await _changeCategoryUseCase(
        Params(currentCategory: unchangedCategory));

    // assert
    expect(result, Right(changedCategory));
    verify(_mockCategoryRepository.changeCategory(any));
    verifyNoMoreInteractions(_mockCategoryRepository);
  });
}
