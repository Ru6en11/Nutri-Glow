import 'package:nutri_glow/domain/entities/product/product.dart';

abstract class ProductMapper {
  static Map<String, dynamic> toJson(Product product) => <String, dynamic>{
        "name": product.name,
        "calories": product.calories,
        "protein": product.protein,
        "fat": product.fat,
        "carb": product.carbohydrate,
        "weight": product.weight,
      };
}

abstract class ProductRequestMapper {
  static ProductRequest fromJson(Map<String, dynamic> json) =>
      ProductRequest(name: json["name"] as String, weight: json["weight"] as double);
}
