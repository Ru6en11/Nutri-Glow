
import 'package:nutri_glow/domain/entities/meal/meal.dart';

abstract class MealNutritionBoundary {

  Future<List<Map<String, dynamic>>> execute(List<MealRequest> meals);

}