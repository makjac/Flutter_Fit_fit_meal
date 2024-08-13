import 'package:fit_fit_meal/data/models/activity_item.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ActivityItem', () {
    test('copyWith should create a new instance with updated values', () {
      const original = ActivityItem(
        lottiePath: 'path1',
        label: 'label1',
        value: 10.0,
      );

      final updated = original.copyWith(
        lottiePath: 'path2',
        label: null, // Should keep the original value
        value: 20.0,
      );

      expect(updated.lottiePath, 'path2');
      expect(updated.label, 'label1');
      expect(updated.value, 20.0);
    });

    test('merge should replace all values with values from another instance',
        () {
      const original = ActivityItem(
        lottiePath: 'path1',
        label: 'label1',
        value: 10.0,
      );

      const modelToMerge = ActivityItem(
        lottiePath: 'path2',
        label: 'label2',
        value: 20.0,
      );

      final merged = original.merge(modelToMerge);

      expect(merged.lottiePath, 'path2');
      expect(merged.label, 'label2');
      expect(merged.value, 20.0);
    });

    test('Equatable should correctly check equality', () {
      const item1 = ActivityItem(
        lottiePath: 'path1',
        label: 'label1',
        value: 10.0,
      );

      const item2 = ActivityItem(
        lottiePath: 'path1',
        label: 'label1',
        value: 10.0,
      );

      const item3 = ActivityItem(
        lottiePath: 'path2',
        label: 'label2',
        value: 20.0,
      );

      expect(item1, equals(item2));
      expect(item1, isNot(equals(item3)));
    });
  });
}
