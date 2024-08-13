import 'package:fit_fit_meal/utils/scale.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Scale', () {
    test('should return max value when scale exceeds max', () {
      const width = 6000.0;
      const max = 0.5;
      final result = Scale.textScale(width, max);

      // (6000 / 3) * 0.008 = 2000.0 * 0.008 = 16.0, which is more than max
      expect(result, max);
    });

    test('should return max value when scale is equal to max', () {
      const width = 375.0; // (375 / 3) * 0.008 = 1000.0 * 0.008 = 0.5
      const max = 0.5;
      final result = Scale.textScale(width, max);

      expect(result, max);
    });

    test('should return 0 when width is 0', () {
      const width = 0.0;
      const max = 1.0;
      final result = Scale.textScale(width, max);

      // (0 / 3) * 0.008 = 0.0
      expect(result, 0.0);
    });
  });
}
