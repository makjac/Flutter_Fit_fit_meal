import 'package:fit_fit_meal/utils/user_shared_preferences.dart';

//calculates ppm using the Harris-Benedict formula
class CalorieCalculator {
  static double? calculatePPM(bool gender) {
    final weight = UserSharedPreferences.getUserWeight();
    final height = UserSharedPreferences.getUserHeight();
    final age = UserSharedPreferences.getUserAge();
    if (weight != null && height != null && age != null) {
      if (gender) {
        //male
        return 66.5 + (13.75 * weight) + (5.003 * height) - (6.775 * age);
      }
      //female
      return 665.1 + (9.563 * weight) + (1.85 * height) - (4.676 * age);
    }
    return null;
  }

  static double? calculateCPM(double ppm) {
    final pal = UserSharedPreferences.getUserPAL();
    if (pal != null) {
      return ppm * pal;
    }
    return null;
  }
}
