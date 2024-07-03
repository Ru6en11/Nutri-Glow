import 'package:nutri_glow/domain/entities/meal/meal.dart';
import 'package:nutri_glow/domain/entities/meal/meal_mapper.dart';
import 'package:nutri_glow/domain/entities/product/product.dart';
import 'package:nutri_glow/domain/entities/product/product_gateway.dart';
import 'package:nutri_glow/domain/interactors/meal_nutrition/meal_nutrition_boundary.dart';

class MealNutritionInteractor implements MealNutritionBoundary {
  final ProductGateway _productGateway;

  const MealNutritionInteractor(this._productGateway);

  @override
  Future<List<Map<String, dynamic>>> execute(List<MealRequest> _meals) async {
    final List<Map<String, dynamic>> mealsJson = [];
    for (final mealRequest in _meals) {
      final List<Product> products = await _getProductsByProductRequests(mealRequest.products);
      final double calories = products.map((p) => p.calories).toList().reduce((totalKcal, kcal) => totalKcal + kcal);
      final Meal meal = Meal(name: mealRequest.name, calories: calories, products: products);

      mealsJson.add(MealMapper.toJson(meal));
    }

    return mealsJson;
  }

  Future<List<Product>> _getProductsByProductRequests(
    List<ProductRequest> _products,
  ) async {
    final List<Product> products = [];
    
    for (final productRequest in _products) {
      final Product product = await _productGateway.findOneByName(productRequest.name);
      final Product productByWeight = product / product.weight * productRequest.weight;

      products.add(productByWeight);
    }

    return products;
  }
}
