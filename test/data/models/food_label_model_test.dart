import 'dart:convert';

import 'package:fit_fit_meal/data/models/food_label_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('FoodLabel', () {
    test('constructor should initialize fields correctly', () {
      const foodLabel = FoodLabel(
        energy: 100,
        fat: 5,
        saturated: 2,
        protein: 10,
        salt: 1,
        sugar: 3,
        carbohydrates: 20,
      );

      expect(foodLabel.energy, 100);
      expect(foodLabel.fat, 5);
      expect(foodLabel.saturated, 2);
      expect(foodLabel.protein, 10);
      expect(foodLabel.salt, 1);
      expect(foodLabel.sugar, 3);
      expect(foodLabel.carbohydrates, 20);
    });

    test('copyWith should create a new instance with updated values', () {
      const original = FoodLabel(
        energy: 100,
        fat: 5,
        saturated: 2,
        protein: 10,
        salt: 1,
        sugar: 3,
        carbohydrates: 20,
      );

      final updated = original.copyWith(
        energy: 150,
        fat: null,
        saturated: 3,
      );

      expect(updated.energy, 150);
      expect(updated.fat, 5); // should keep the original value
      expect(updated.saturated, 3);
      expect(updated.protein, 10); // should keep the original value
    });

    test('operator + should add values from two FoodLabel instances', () {
      const label1 = FoodLabel(
        energy: 100,
        fat: 5,
        saturated: 2,
        protein: 10,
        salt: 1,
        sugar: 3,
        carbohydrates: 20,
      );

      const label2 = FoodLabel(
        energy: 50,
        fat: 2,
        saturated: 1,
        protein: 5,
        salt: 0,
        sugar: 1,
        carbohydrates: 10,
      );

      final result = label1 + label2;

      expect(result.energy, 150);
      expect(result.fat, 7);
      expect(result.saturated, 3);
      expect(result.protein, 15);
      expect(result.salt, 1);
      expect(result.sugar, 4);
      expect(result.carbohydrates, 30);
    });

    test('toMap should convert FoodLabel to a Map correctly', () {
      const foodLabel = FoodLabel(
        energy: 100,
        fat: 5,
        saturated: 2,
        protein: 10,
        salt: 1,
        sugar: 3,
        carbohydrates: 20,
      );

      final map = foodLabel.toMap();

      expect(map['energy'], 100);
      expect(map['fat'], 5);
      expect(map['saturated'], 2);
      expect(map['protein'], 10);
      expect(map['salt'], 1);
      expect(map['sugar'], 3);
      expect(map['carbohydrates'], 20);
    });

    test('fromMap should create a FoodLabel from a Map', () {
      final map = {
        'energy': 100,
        'fat': 5,
        'saturated': 2,
        'protein': 10,
        'salt': 1,
        'sugar': 3,
        'carbohydrates': 20,
      };

      final foodLabel = FoodLabel.fromMap(map);

      expect(foodLabel.energy, 100);
      expect(foodLabel.fat, 5);
      expect(foodLabel.saturated, 2);
      expect(foodLabel.protein, 10);
      expect(foodLabel.salt, 1);
      expect(foodLabel.sugar, 3);
      expect(foodLabel.carbohydrates, 20);
    });

    test('toJson should convert FoodLabel to JSON string', () {
      const foodLabel = FoodLabel(
        energy: 100,
        fat: 5,
        saturated: 2,
        protein: 10,
        salt: 1,
        sugar: 3,
        carbohydrates: 20,
      );

      final jsonString = foodLabel.toJson();
      final expectedJsonString = json.encode({
        'energy': 100,
        'fat': 5,
        'saturated': 2,
        'protein': 10,
        'salt': 1,
        'sugar': 3,
        'carbohydrates': 20,
      });

      expect(jsonString, expectedJsonString);
    });

    test('fromJson should create a FoodLabel from JSON string', () {
      final jsonString = json.encode({
        'energy': 100,
        'fat': 5,
        'saturated': 2,
        'protein': 10,
        'salt': 1,
        'sugar': 3,
        'carbohydrates': 20,
      });

      final foodLabel = FoodLabel.fromJson(jsonString);

      expect(foodLabel.energy, 100);
      expect(foodLabel.fat, 5);
      expect(foodLabel.saturated, 2);
      expect(foodLabel.protein, 10);
      expect(foodLabel.salt, 1);
      expect(foodLabel.sugar, 3);
      expect(foodLabel.carbohydrates, 20);
    });

    test('Equatable should correctly check equality', () {
      const label1 = FoodLabel(
        energy: 100,
        fat: 5,
        saturated: 2,
        protein: 10,
        salt: 1,
        sugar: 3,
        carbohydrates: 20,
      );

      const label2 = FoodLabel(
        energy: 100,
        fat: 5,
        saturated: 2,
        protein: 10,
        salt: 1,
        sugar: 3,
        carbohydrates: 20,
      );

      const label3 = FoodLabel(
        energy: 200,
        fat: 10,
        saturated: 4,
        protein: 20,
        salt: 2,
        sugar: 6,
        carbohydrates: 40,
      );

      expect(label1, equals(label2));
      expect(label1, isNot(equals(label3)));
    });
  });
}
