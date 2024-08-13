import 'package:fit_fit_meal/utils/validator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Validator', () {
    test('isEmail should return true for valid email', () {
      const validEmail = 'test@example.com';
      final result = Validator.isEmail(validEmail);

      expect(result, true);
    });

    test('isEmail should return false for invalid email', () {
      const invalidEmail = 'test@.com';
      final result = Validator.isEmail(invalidEmail);

      expect(result, false);
    });

    test('isEmail should return false for null email', () {
      final result = Validator.isEmail(null);

      expect(result, false);
    });

    test('isStringNull should return true for non-null, non-empty string', () {
      const nonEmptyString = 'Hello';
      final result = Validator.isStringNull(nonEmptyString);

      expect(result, true);
    });

    test('isStringNull should return false for null string', () {
      final result = Validator.isStringNull(null);

      expect(result, false);
    });

    test('isStringNull should return false for empty string', () {
      const emptyString = '';
      final result = Validator.isStringNull(emptyString);

      expect(result, false);
    });
  });
}
