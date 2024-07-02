class AnthropometricData {
  final String userId;
  final Gender gender;
  final int age;
  final int weight;
  final int height;
  final ActivityLevel activityLevel;
  final Goal goal;

  const AnthropometricData({
    required this.userId,
    required this.gender,
    required this.age,
    required this.weight,
    required this.height,
    required this.activityLevel,
    required this.goal,
  });
}

enum Gender {
  male,
  female,
}

extension GenderExt on Gender {
  String asString() {
    final String enumString = this.toString();
    final String value = enumString.split('.').last;

    return value;
  }
}

enum ActivityLevel {
  sedentary,
  light,
  moderate,
  active,
  veryActive,
}

extension ActivityLevelExt on ActivityLevel {
  double get multiply => switch (this) {
        ActivityLevel.sedentary => 1.2,
        ActivityLevel.light => 1.375,
        ActivityLevel.moderate => 1.55,
        ActivityLevel.active => 1.725,
        ActivityLevel.veryActive => 1.9,
      };

  String asString() {
    final String enumAsString = this.toString();
    final String value = enumAsString.split('.').last;
    final String valueWithSnakeCase = value.replaceAllMapped(
      RegExp(r'[A-Z]'),
      (Match math) => "_${math.group(0)!.toLowerCase()}",
    );

    return valueWithSnakeCase;
  }
}

enum Goal {
  lose,
  maintain,
  gain,
}

extension GoalExt on Goal {
  double get multiply => switch (this) {
        Goal.lose => 0.8,
        Goal.maintain => 1.0,
        Goal.gain => 1.2,
      };

  String asString() {
    final String enumAsString = this.toString();
    final String value = enumAsString.split('.').last;

    return value;
  }
}
