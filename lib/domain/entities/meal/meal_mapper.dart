import 'package:nutri_glow/domain/entities/meal/meal.dart';
import 'package:nutri_glow/domain/entities/product/product.dart';
import 'package:nutri_glow/domain/entities/product/product_mapper.dart';

abstract class MealMapper {
  static Map<String, dynamic> toJson(Meal meal) {
    final List<Map<String, dynamic>> products =
        meal.products.map((product) => ProductMapper.toJson(product)).toList();

    return <String, dynamic>{
      "name": meal.name,
      "calories": meal.calories,
      "products": products,
    };
  }
}

abstract class MealRequestMapper {
  static MealRequest fromJson(Map<String, dynamic> json) {
    final String name = json["name"] as String;
    final List<ProductRequest> products =
        (json["products"] as List<dynamic>)
            .map((body) => ProductRequestMapper.fromJson(body))
            .toList();

    return MealRequest(name: name, products: products);
  }
}
