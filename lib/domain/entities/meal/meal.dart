
import 'package:nutri_glow/domain/entities/product/product.dart';

class Meal {
  final String name;
  final double calories;
  final List<Product> products;

  const Meal({
    required this.name,
    required this.calories,
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