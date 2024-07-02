
import 'package:nutri_glow/domain/entities/anthropometric_data/anthropometric_data.dart';

abstract class AnthropometricDataMapper {
  static AnthropometricData fromJson(Map<String, dynamic> json) =>
      AnthropometricData(
        userId: json["user_id"] as String,
        gender: json["gender"] as String,
        age: json["age"] as int,
        weight: json["weight"] as int,
        height: json["height"] as int,
        activityLevel: json["activity_level"] as String,
        goal: json["goal"] as String,
      );

  static Map<String, dynamic> toJson(AnthropometricData data) =>
      <String, dynamic>{
        "user_id": data.userId,
        "gender": data..gender,
        "age": data.age,
        "weight": data.weight,
        "height": data.height,
        "activity_level": data.activityLevel,
        "goal": data.goal,
      };
}
