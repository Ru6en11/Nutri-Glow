import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:nutri_glow/config.dart';
import 'package:nutri_glow/domain/entities/product/product_gateway.dart';
import 'package:nutri_glow/domain/entities/product/product.dart';

class UsdaProductGateway implements ProductGateway {
  static const String _usdaBaseUrl = "https://api.nal.usda.gov/fdc/v1";
  final String _usdaKey = Config().usdaKey;

  @override
  Future<Product> findOneByName(String productName) async {
    final Uri url = Uri.parse(
        "$_usdaBaseUrl/foods/search?api_key=$_usdaKey&query=$productName&pageSize=1");

    final http.Response response = await http.get(url);

    if (response.statusCode != HttpStatus.ok) {
      throw Exception("Failed to fetch data from USDA");
    }

    final Map<String, dynamic> jsonResponse = jsonDecode(response.body);
    final List<dynamic> foods = jsonResponse['foods'];

    if (foods.isEmpty) {
      throw Exception("No products found with the name $productName");
    }

    final Map<String, dynamic> food = foods.first;
    final String name = food["description"];
    double protein = 0.0;
    double fat = 0.0;
    double carbohydrate = 0.0;
    double calories = 0.0;

    for (final nutrient in food['foodNutrients']) {
      switch (nutrient['nutrientName']) {
        case 'Protein':
          protein = (nutrient['value'] as num).toDouble();
          break;
        case 'Total lipid (fat)':
          fat = (nutrient['value'] as num).toDouble();
          break;
        case 'Carbohydrate, by difference':
          carbohydrate = (nutrient['value'] as num).toDouble();
          break;
        case 'Energy':
          calories = (nutrient['value'] as num).toDouble();
      }
    }

    final product = Product(
      name: name,
      calories: calories,
      protein: protein,
      fat: fat,
      carbohydrate: carbohydrate,
    );

    return product;
  }
}
