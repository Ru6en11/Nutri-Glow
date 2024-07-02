
import 'package:nutri_glow/domain/entities/anthropometric_data/anthropometric_data.dart';
import 'package:nutri_glow/domain/entities/anthropometric_data/anthropometric_gateway.dart';
import 'package:nutri_glow/domain/interactors/calorie_intake/calorie_intake_boundary.dart';

class CalorieIntakeInteractor implements CalorieIntakeBoundary {

  final AnthropometricGateway _anthropometricGateway;

  const CalorieIntakeInteractor(this._anthropometricGateway);

  @override
  Map<String, dynamic> execute(String userId) {
    final AnthropometricData data = _anthropometricGateway.findOneByUserId(userId);
    
    final bmr = calculateCalorieIntake(data);

    return <String, dynamic> {
      "bmr": bmr,
    };
  }

  double calculateCalorieIntake(AnthropometricData data) {
    final double bmr = data.gender == Gender.male
      ? _calculateBmrForMale(data)
      : _calculateBmrForFemale(data);
    
    return bmr;
  }

  double _calculateBmrForMale(AnthropometricData data) {
     double bmr = 88.36 + (13.4 * data.weight) + (4.8 * data.height) - (5.7 * data.age);
     bmr *= data.activityLevel.multiply;
     bmr *= data.goal.multiply;

     return bmr;
  }

  double _calculateBmrForFemale(AnthropometricData data) {
    double bmr = 447.6 + (9.2 * data.weight) + (3.1 * data.height) - (4.3 * data.age);  
    bmr *= data.activityLevel.multiply;
    bmr *= data.goal.multiply;

    return bmr;
  }

}