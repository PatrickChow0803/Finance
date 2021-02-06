import 'package:dartz/dartz.dart';
import 'package:finance/domain/receipt/receipt.dart';

Either<String, Category> validateCategoryNotEmpty(Category category) {
  if (category != null) {
    return right(category);
  } else {
    return left(
        // used to display to the user what went wrong
        "Category can't be left empty");
  }
}

Either<String, double> validatePriceNotEmpty(double price) {
  if (price != null) {
    return right(price);
  } else {
    return left(
        // used to display to the user what went wrong
        "Price can't be left empty");
  }
}
