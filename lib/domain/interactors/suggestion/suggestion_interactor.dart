
import 'package:nutri_glow/domain/entities/product/product.dart';
import 'package:nutri_glow/domain/entities/product/product_gateway.dart';
import 'package:nutri_glow/domain/entities/product/product_mapper.dart';
import 'package:nutri_glow/domain/interactors/suggestion/suggestion_boundary.dart';

class SuggestionInteractor implements SuggestionBoundary {
  final ProductGateway _productGateway;

  const SuggestionInteractor(this._productGateway);

  @override
  Future<List<Map<String, dynamic>>> execute(String nutrient, double amount) async {
    final supportedNutrients = ['proteint', 'fat', 'carbohydrate',];
    if (!supportedNutrients.contains(nutrient)) throw Exception("Nutrient $nutrient is not supperted");

    final List<Product> suggestedProducts = await _productGateway.findSomeByNutrient(nutrient, amount);
    
    final List<Map<String, dynamic>> json = suggestedProducts.map((product) => ProductMapper.toJson(product)).toList();

    return json;
  }

}