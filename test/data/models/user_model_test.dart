import 'dart:convert';
import 'package:fit_fit_meal/data/models/user_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('UserModel', () {
    const testUid = 'test_uid';
    const testLogin = 'test_login';
    const testGender = true;
    const testWeight = 70.0;
    const testHeight = 180.0;
    const testAge = 25;
    const testPal = 1.2;

    test('constructor should initialize fields correctly', () {
      const userModel = UserModel(
        uid: testUid,
        login: testLogin,
        gender: testGender,
        weight: testWeight,
        height: testHeight,
        age: testAge,
        pal: testPal,
      );

      expect(userModel.uid, testUid);
      expect(userModel.login, testLogin);
      expect(userModel.gender, testGender);
      expect(userModel.weight, testWeight);
      expect(userModel.height, testHeight);
      expect(userModel.age, testAge);
      expect(userModel.pal, testPal);
    });

    test('toMap should convert UserModel to a Map', () {
      const userModel = UserModel(
        uid: testUid,
        login: testLogin,
        gender: testGender,
        weight: testWeight,
        height: testHeight,
        age: testAge,
        pal: testPal,
      );

      final map = userModel.toMap();

      expect(map['login'], testLogin);
      expect(map['gender'], testGender);
      expect(map['weight'], testWeight);
      expect(map['height'], testHeight);
      expect(map['age'], testAge);
      expect(map['pal'], testPal);
    });

    test('copyWith should create a new instance with updated values', () {
      const originalUserModel = UserModel(
        uid: testUid,
        login: testLogin,
        gender: testGender,
        weight: testWeight,
        height: testHeight,
        age: testAge,
        pal: testPal,
      );

      final updatedUserModel = originalUserModel.copyWith(
        login: 'new_login',
        weight: 75,
      );

      expect(updatedUserModel.uid, testUid);
      expect(updatedUserModel.login, 'new_login');
      expect(updatedUserModel.gender, testGender);
      expect(updatedUserModel.weight, 75);
      expect(updatedUserModel.height, testHeight);
      expect(updatedUserModel.age, testAge);
      expect(updatedUserModel.pal, testPal);
    });

    test('toJson should convert UserModel to JSON string', () {
      const userModel = UserModel(
        uid: testUid,
        login: testLogin,
        gender: testGender,
        weight: testWeight,
        height: testHeight,
        age: testAge,
        pal: testPal,
      );

      final jsonString = userModel.toJson();
      final expectedJsonString = json.encode(userModel.toMap());

      expect(jsonString, expectedJsonString);
    });

    test('Equatable should correctly check equality', () {
      const userModel1 = UserModel(
        uid: testUid,
        login: testLogin,
        gender: testGender,
        weight: testWeight,
        height: testHeight,
        age: testAge,
        pal: testPal,
      );

      const userModel2 = UserModel(
        uid: testUid,
        login: testLogin,
        gender: testGender,
        weight: testWeight,
        height: testHeight,
        age: testAge,
        pal: testPal,
      );

      const userModel3 = UserModel(
        uid: 'different_uid',
        login: 'different_login',
        gender: false,
        weight: 80,
        height: 170,
        age: 30,
        pal: 1.5,
      );

      expect(userModel1, equals(userModel2));
      expect(userModel1, isNot(equals(userModel3)));
    });
  });
}
