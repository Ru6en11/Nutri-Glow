
import 'package:nutri_glow/domain/entities/anthropometric_data/anthropometric_data.dart';

abstract class AnthropometricDataMapper {
  static AnthropometricData fromJson(Map<String, dynamic> json) =>
      AnthropometricData(
        userId: json["user_id"] as String,
        gender: _parseGenderFromString(json["gender"] as String),
        age: json["age"] as int,
        weight: json["weight"] as int,
        height: json["height"] as int,
        activityLevel: _parseActivityLevelFromString(json["activity_level"] as String),
        goal: _parseGoalFromString(json["goal"] as String),
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
    
  static Gender _parseGenderFromString(String parsedString) {
    for (final value in Gender.values) {
      if (parsedString == value.asString()) return value;
    }

    throw Exception("Parse Error");
  }
  static ActivityLevel _parseActivityLevelFromString(String parsedValue) {
    for (final value in ActivityLevel.values) {
      if (parsedValue == value.asString()) return value;
    }

    throw Exception('Parse Error!');
  }

  static Goal _parseGoalFromString(String parsedString) {
    for (final value in Goal.values) {
      if (parsedString == value.asString()) return value;
    }

    throw Exception('Parse Error!');
  }
}