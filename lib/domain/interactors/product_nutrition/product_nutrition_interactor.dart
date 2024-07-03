
import 'package:nutri_glow/domain/entities/product/product_gateway.dart';
import 'package:nutri_glow/domain/entities/product/product.dart';
import 'package:nutri_glow/domain/entities/product/product_mapper.dart';
import 'package:nutri_glow/domain/interactors/product_nutrition/product_nutrition_boundary.dart';

class ProductNutritionInteractor implements ProductNutritionBoundary {
  static const int _defaultProductWeight = 100;
  final ProductGateway _productGateway;

  ProductNutritionInteractor(this._productGateway);
   
  @override
  Future<Map<String, dynamic>> execute(String productName, int? productWeight) async {
    final Product product = await _productGateway.findOneByName(productName);

    final int multiply = productWeight ?? _defaultProductWeight; 

    final Product productByWeight = product / 100 * multiply.toDouble();

    return ProductMapper.toJson(productByWeight);
  }

}