import 'dart:math';

import 'package:fit_fit_meal/utils/user_shared_preferences.dart';

//calculates ppm using the Harris-Benedict formula
class CalorieCalculator {
  static double? calculatePPM() {
    final gender = UserSharedPreferences.getUserGender();
    final weight = UserSharedPreferences.getUserWeight();
    final height = UserSharedPreferences.getUserHeight();
    final age = UserSharedPreferences.getUserAge();
    if (weight != null && height != null && age != null && gender != null) {
      if (gender) {
        //male
        return 66.5 + (13.75 * weight) + (5.003 * height) - (6.775 * age);
      }
      //female
      return 665.1 + (9.563 * weight) + (1.85 * height) - (4.676 * age);
    }
    return null;
  }

  static double? calculateCPM(double? ppm) {
    final pal = UserSharedPreferences.getUserPAL();
    if (pal != null && ppm != null) {
      return ppm * pal;
    }
    return null;
  }

  static double? calculateBMI() {
    final weight = UserSharedPreferences.getUserWeight();
    final height = UserSharedPreferences.getUserHeight();
    if (weight != null && height != 0 && height != null) {
      return weight / pow(height / 100, 2);
    }
    return null;
  }
}
