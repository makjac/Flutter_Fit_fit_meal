import 'package:fit_fit_meal/utils/integer_text_input_formater.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('IntegerTextInputFormatter', () {
    final formatter = IntegerTextInputFormatter();

    test('should allow valid integer input', () {
      const oldValue = TextEditingValue(text: '123');
      const newValue = TextEditingValue(text: '123');

      final result = formatter.formatEditUpdate(oldValue, newValue);

      expect(result.text, '123');
      expect(result.selection, newValue.selection);
    });

    test('should handle empty input', () {
      const oldValue = TextEditingValue(text: '');
      const newValue = TextEditingValue(text: '');

      final result = formatter.formatEditUpdate(oldValue, newValue);

      expect(result.text, '');
      expect(result.selection, newValue.selection);
    });

    test('should handle input that is a valid integer', () {
      const oldValue = TextEditingValue(text: '456');
      const newValue = TextEditingValue(text: '456');

      final result = formatter.formatEditUpdate(oldValue, newValue);

      expect(result.text, '456');
      expect(result.selection, newValue.selection);
    });
  });
}
