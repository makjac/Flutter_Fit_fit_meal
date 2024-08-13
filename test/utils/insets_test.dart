import 'package:fit_fit_meal/utils/insets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Insets', () {
    test('xs should be 8.0', () {
      expect(Insets.xs, 8.0);
    });

    test('s should be 16.0', () {
      expect(Insets.s, 16.0);
    });

    test('m should be 24.0', () {
      expect(Insets.m, 24.0);
    });

    test('l should be 32.0', () {
      expect(Insets.l, 32.0);
    });

    test('xl should be 40.0', () {
      expect(Insets.xl, 40.0);
    });

    test('xxl should be 48.0', () {
      expect(Insets.xxl, 48.0);
    });
  });
}
