import 'package:nutri_glow/domain/entities/product/product.dart';

abstract class ProductMapper {
  static Map<String, dynamic> toJson(Product product) => <String, dynamic>{
        "name": product.name,
        "protein": product.protein,
        "fat": product.fat,
        "carb": product.carbohydrate,
      };
}
