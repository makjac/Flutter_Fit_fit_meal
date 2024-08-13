import 'package:fit_fit_meal/utils/daily_values.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DailyValues', () {
    test('fat should be 65', () {
      expect(DailyValues.fat, 65);
    });

    test('saturated should be 20', () {
      expect(DailyValues.saturated, 20);
    });

    test('cholesterol should be 0.3', () {
      expect(DailyValues.cholesterol, 0.3);
    });

    test('sodium should be 2.3', () {
      expect(DailyValues.sodium, 2.3);
    });

    test('carbohydrate should be 275', () {
      expect(DailyValues.carbohydrate, 275);
    });

    test('protein should be 50', () {
      expect(DailyValues.protein, 50);
    });

    test('sugar should be 50', () {
      expect(DailyValues.sugar, 50);
    });
  });
}
