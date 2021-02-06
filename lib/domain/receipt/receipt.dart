import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

part 'receipt.freezed.dart';

enum Category {
  groceries,
  entertainment,
  restaurant,
  fuel,
  other,
}

@freezed
abstract class Receipt implements _$Receipt {
  const Receipt._();

  const factory Receipt({
    @required String id,
    @required Category category,
    @required double price,
    @required DateTime date,
  }) = _Receipt;

  // this is the default receipt when a new receipt is opened
  factory Receipt.empty() => Receipt(
        id: Uuid().v1(),
        category: Category.other,
        price: 0.0,
        date: DateTime.now(),
      );
}
