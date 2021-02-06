import 'package:freezed_annotation/freezed_annotation.dart';

part 'receipt_failure.freezed.dart';

@freezed
abstract class ReceiptFailure with _$ReceiptFailure {
  const factory ReceiptFailure.unexpected() = _Unexpected;
  const factory ReceiptFailure.insufficientPermission() = _InsufficientPermission;
  const factory ReceiptFailure.unableToUpdate() = _UnableToUpdate;
}
