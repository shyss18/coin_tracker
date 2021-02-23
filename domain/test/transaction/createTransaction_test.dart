import 'package:dartz/dartz.dart';
import 'package:domain/contracts/repositories/transactionRepository.dart';
import 'package:domain/entities/transaction.dart';
import 'package:domain/usecases/transaction/createTransaction.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockTransactionRepository extends Mock implements TransactionRepository {}

void main() {
  CreateTransaction _createTransactionUseCase;
  MockTransactionRepository _mockTransactionRepository;

  setUp(() {
    _mockTransactionRepository = MockTransactionRepository();
    _createTransactionUseCase =
        CreateTransaction(transactionRepository: _mockTransactionRepository);
  });

  final newTransaction = Transaction();

  test('Should return created transaction model.', () async {
    // arrange
    when(_mockTransactionRepository.createTransaction(any))
        .thenAnswer((_) async => Right(newTransaction));

    // act
    final result =
        await _createTransactionUseCase(Params(newTransaction: newTransaction));

    // assert
    expect(result, Right(newTransaction));
    verify(_mockTransactionRepository.createTransaction(any));
    verifyNoMoreInteractions(_mockTransactionRepository);
  });
}
