import 'package:fit_fit_meal/widgets/boxDecoration/shadow_radius_all.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('shadowRadiusAll', () {
    test(
        'should return a BoxDecoration with the correct radius and shadow properties',
        () {
      const double radius = 8.0;
      final decoration = shadowRadiusAll(radius);

      // Check the color
      expect(decoration.color, Colors.white);

      // Check the borderRadius
      expect(
        decoration.borderRadius,
        BorderRadius.circular(radius),
      );

      // Check the boxShadow
      expect(decoration.boxShadow, isNotEmpty);
      expect(decoration.boxShadow?.length, 1);
      final boxShadow = decoration.boxShadow?.first;
      expect(boxShadow?.color, const Color.fromARGB(50, 116, 0, 0));
      expect(boxShadow?.blurRadius, 2);
      expect(boxShadow?.spreadRadius, 1);
      expect(boxShadow?.offset, const Offset(3, 3));
    });
  });
}
