// I in the class name stands for Interface
// Treat this abstract class as an Interface.

// Abstract classes can have constants, members, method stubs (methods without a body)
// whereas interfaces can only have constants and methods stubs.
import 'package:dartz/dartz.dart';
import 'package:finance/domain/receipt/receipt.dart';
import 'package:finance/domain/receipt/receipt_failure.dart';

abstract class IReceiptRepository {
  // watches all of the receipts
  // receipts come in as a stream and can either return a ReceiptFailure or a list of receipts
  Stream<Either<ReceiptFailure, List<Receipt>>> watchAll();

  // watches only favorite receipts
  Stream<Either<ReceiptFailure, List<Receipt>>> watchFavorite();

  // When creating a receipts, you can either fail when creating it
  // or you can successfully create the receipts but nothing needs to be returned
  Future<Either<ReceiptFailure, Unit>> create(Receipt receipt);
  Future<Either<ReceiptFailure, Unit>> update(Receipt receipt);
  Future<Either<ReceiptFailure, Unit>> delete(Receipt receipt);
}
