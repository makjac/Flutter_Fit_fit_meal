import 'dart:convert';
import 'package:fit_fit_meal/data/models/food_label_model.dart';
import 'package:fit_fit_meal/data/models/product_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Product', () {
    const testBarcode = '123456789';
    const testName = 'Product Name';
    const testProducer = 'Producer Name';
    const testUnit = 'kg';

    const testFoodLabel = FoodLabel(
      energy: 100,
      fat: 5,
      saturated: 2,
      protein: 10,
      salt: 1,
      sugar: 3,
      carbohydrates: 20,
    );

    test('constructor should initialize fields correctly', () {
      const product = Product(
        barcode: testBarcode,
        name: testName,
        producer: testProducer,
        unit: testUnit,
        nutritionalLabelling: testFoodLabel,
      );

      expect(product.barcode, testBarcode);
      expect(product.name, testName);
      expect(product.producer, testProducer);
      expect(product.unit, testUnit);
      expect(product.nutritionalLabelling, testFoodLabel);
    });

    test('copyWith should create a new instance with updated values', () {
      final originalProduct = Product(
        barcode: testBarcode,
        name: testName,
        producer: testProducer,
        unit: testUnit,
        nutritionalLabelling: testFoodLabel,
      );

      final updatedProduct = originalProduct.copyWith(
        barcode: '987654321',
        name: 'New Product Name',
        nutritionalLabelling: const FoodLabel(
          energy: 200,
          fat: 10,
          saturated: 4,
          protein: 20,
          salt: 2,
          sugar: 6,
          carbohydrates: 40,
        ),
      );

      expect(updatedProduct.barcode, '987654321');
      expect(updatedProduct.name, 'New Product Name');
      expect(updatedProduct.producer, testProducer);
      expect(updatedProduct.unit, testUnit);
      expect(updatedProduct.nutritionalLabelling.energy, 200);
    });

    test('toMap should convert Product to a Map', () {
      final product = Product(
        barcode: testBarcode,
        name: testName,
        producer: testProducer,
        unit: testUnit,
        nutritionalLabelling: testFoodLabel,
      );

      final map = product.toMap();

      expect(map['barcode'], testBarcode);
      expect(map['name'], testName);
      expect(map['producer'], testProducer);
      expect(map['unit'], testUnit);
      expect(map['nutritional_labelling'], testFoodLabel.toMap());
    });

    test('fromMap should create a Product from a Map', () {
      final map = {
        'barcode': testBarcode,
        'name': testName,
        'producer': testProducer,
        'unit': testUnit,
        'nutritional_labelling': testFoodLabel.toMap(),
      };

      final product = Product.fromMap(map);

      expect(product.barcode, testBarcode);
      expect(product.name, testName);
      expect(product.producer, testProducer);
      expect(product.unit, testUnit);
      expect(product.nutritionalLabelling, testFoodLabel);
    });

    test('toJson should convert Product to JSON string', () {
      final product = Product(
        barcode: testBarcode,
        name: testName,
        producer: testProducer,
        unit: testUnit,
        nutritionalLabelling: testFoodLabel,
      );

      final jsonString = product.toJson();
      final expectedJsonString = json.encode(product.toMap());

      expect(jsonString, expectedJsonString);
    });

    test('fromJson should create a Product from JSON string', () {
      final jsonString = json.encode({
        'barcode': testBarcode,
        'name': testName,
        'producer': testProducer,
        'unit': testUnit,
        'nutritional_labelling': testFoodLabel.toMap(),
      });

      final product = Product.fromJson(jsonString);

      expect(product.barcode, testBarcode);
      expect(product.name, testName);
      expect(product.producer, testProducer);
      expect(product.unit, testUnit);
      expect(product.nutritionalLabelling, testFoodLabel);
    });

    test('Equatable should correctly check equality', () {
      final product1 = Product(
        barcode: testBarcode,
        name: testName,
        producer: testProducer,
        unit: testUnit,
        nutritionalLabelling: testFoodLabel,
      );

      final product2 = Product(
        barcode: testBarcode,
        name: testName,
        producer: testProducer,
        unit: testUnit,
        nutritionalLabelling: testFoodLabel,
      );

      const product3 = Product(
        barcode: '987654321',
        name: 'Different Name',
        producer: 'Different Producer',
        unit: 'L',
        nutritionalLabelling: FoodLabel(
          energy: 200,
          fat: 10,
          saturated: 4,
          protein: 20,
          salt: 2,
          sugar: 6,
          carbohydrates: 40,
        ),
      );

      expect(product1, equals(product2));
      expect(product1, isNot(equals(product3)));
    });
  });
}
