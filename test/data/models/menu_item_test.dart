import 'package:fit_fit_meal/data/models/menu_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('MenuElement', () {
    test('constructor should initialize fields correctly', () {
      const icon = Icon(Icons.home);
      const menuElement = MenuElement(
        label: 'Home',
        icon: icon,
      );

      expect(menuElement.label, 'Home');
      expect(menuElement.icon, icon);
    });

    test('label and icon should be correctly assigned', () {
      const icon = Icon(Icons.settings);
      const menuElement = MenuElement(
        label: 'Settings',
        icon: icon,
      );

      expect(menuElement.label, 'Settings');
      expect(menuElement.icon, icon);
    });
  });
}
