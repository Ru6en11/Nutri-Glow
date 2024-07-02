
import 'package:nutri_glow/domain/entities/anthropometric_data/anthropometric_data.dart';

abstract class CalorieIntakeBoundary {

    Map<String, dynamic> execute(AnthropometricData data);

}