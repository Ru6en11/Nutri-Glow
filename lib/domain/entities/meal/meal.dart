
import 'package:nutri_glow/domain/entities/product/product.dart';

class Meal {
  final String name;
  final double calories;
  final double protein;
  final double fat;
  final double carbohydrate;
  final List<Product> products;

  const Meal({
    required this.name,
    required this.calories,
    required this.protein,
    required this.fat,
    required this.carbohydrate,
    required this.products,
  });
}

class MealRequest {
  final String name;
  final List<ProductRequest> products;

  const MealRequest({
    required this.name,
    required this.products,
  });
}