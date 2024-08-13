import 'package:fit_fit_meal/widgets/boxDecoration/home_gradnient_bacground.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('homeGradientBackground', () {
    test('should return a BoxDecoration with the correct gradient properties',
        () {
      final decoration = homeGradientBacground();

      // Check the gradient
      expect(decoration.gradient, isA<LinearGradient>());

      final gradient = decoration.gradient as LinearGradient;

      // Check gradient begin and end
      expect(gradient.begin, Alignment.bottomCenter);
      expect(gradient.end, Alignment.topCenter);

      // Check gradient colors
      expect(gradient.colors, [
        Colors.red,
        Colors.orange,
      ]);
    });
  });
}
