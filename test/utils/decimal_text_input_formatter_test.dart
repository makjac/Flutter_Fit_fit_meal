import 'package:fit_fit_meal/utils/decimal_text_input_formatter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DecimalTextInputFormatter', () {
    test('should not truncate if within the specified decimal range', () {
      final formatter = DecimalTextInputFormatter(decimalRange: 2);

      final result = formatter.formatEditUpdate(
        const TextEditingValue(text: '123.45'),
        const TextEditingValue(text: '123.45'),
      );

      expect(result.text, '123.45');
    });

    test('should handle empty input', () {
      final formatter = DecimalTextInputFormatter(decimalRange: 2);

      final result = formatter.formatEditUpdate(
        const TextEditingValue(text: ''),
        const TextEditingValue(text: ''),
      );

      expect(result.text, '');
    });

    test('should handle single decimal point input', () {
      final formatter = DecimalTextInputFormatter(decimalRange: 2);

      final result = formatter.formatEditUpdate(
        const TextEditingValue(text: '.'),
        const TextEditingValue(text: '.'),
      );

      expect(result.text, '0.');
    });

    test('should keep existing input if input is not a number', () {
      final formatter = DecimalTextInputFormatter(decimalRange: 2);

      final result = formatter.formatEditUpdate(
        const TextEditingValue(text: 'abcd'),
        const TextEditingValue(text: 'abcd'),
      );

      expect(result.text, 'abcd');
    });
  });
}
