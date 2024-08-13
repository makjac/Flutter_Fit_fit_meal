import 'package:fit_fit_meal/utils/null_objects.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('NullObjects', () {
    test('should have default foodLabel with zero values', () {
      final foodLabel = NullObjects.foodLabel;

      expect(foodLabel.energy, 0);
      expect(foodLabel.fat, 0);
      expect(foodLabel.saturated, 0);
      expect(foodLabel.protein, 0);
      expect(foodLabel.salt, 0);
      expect(foodLabel.sugar, 0);
      expect(foodLabel.carbohydrates, 0);
    });

    test('should have default product with empty values', () {
      final product = NullObjects.product;

      expect(product.barcode, "");
      expect(product.name, "");
      expect(product.producer, "");
      expect(product.unit, "");
      expect(product.nutritionalLabelling, NullObjects.foodLabel);
    });

    test(
        'foodLabel in product should be the same instance as NullObjects.foodLabel',
        () {
      final product = NullObjects.product;

      expect(product.nutritionalLabelling, NullObjects.foodLabel);
    });
  });
}
