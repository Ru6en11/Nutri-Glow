
import 'package:nutri_glow/domain/entities/anthropometric_data/anthropometric_data.dart';
import 'package:nutri_glow/domain/interactors/calorie_intake/calorie_intake_boundary.dart';

class CalorieIntakeInteractor implements CalorieIntakeBoundary {
  @override
  Map<String, dynamic> execute(AnthropometricData data) {
    return {};
  }

  double calculateCalorieIntake(AnthropometricData data) {
    
  }

  double calculteBmrForMale(AnthropometricData data) {
     double bmr = 88.36 + (13.4 * data.weight) + (4.8 * data.height) - (5.7 * data.age);
     bmr *= data.activityLevel.multiply;
     bmr *= data.goal.multiply;

     return bmr;
  }

  double calculateBmrForFemale(AnthropometricData data) {
    double bmr = 447.6 + (9.2 * data.weight) + (3.1 * data.height) - (4.3 * data.age);  
    bmr *= data.activityLevel.multiply;
    bmr *= data.goal.multiply;

    return bmr;
  }

}