import 'package:dartz/dartz.dart';
import 'package:domain/contracts/repositories/categoryRepository.dart';
import 'package:domain/entities/category.dart';
import 'package:domain/usecases/category/getCategoryByTitle.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockCategoryRepository extends Mock implements CategoryRepository {}

void main() {
  GetCategoryByTitle _getCategoryByTitleUseCase;
  MockCategoryRepository _mockCategoryRepository;

  setUp(() {
    _mockCategoryRepository = MockCategoryRepository();
    _getCategoryByTitleUseCase =
        GetCategoryByTitle(categoryRepository: _mockCategoryRepository);
  });

  final categoryTitle = 'someTitle';
  final returnedCategory =
      Category(categoryColor: 'someColor', categoryTitle: 'someTitle');

  test('Should return some category model by title.', () async {
    // arrange
    when(_mockCategoryRepository.getCategoryByTitle(any))
        .thenAnswer((_) async => Right(returnedCategory));

    // act
    final result =
        await _getCategoryByTitleUseCase(Params(categoryTitle: categoryTitle));

    // assert
    expect(result, Right(returnedCategory));
    verify(_mockCategoryRepository.getCategoryByTitle(any));
    verifyNoMoreInteractions(_mockCategoryRepository);
  });
}
