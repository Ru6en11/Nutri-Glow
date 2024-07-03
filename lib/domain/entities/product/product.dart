
class Product {
  final String name;
  final double protein;
  final double fat;
  final double carbohydrate;
  final double weight;

  const Product({
    required this.name,
    required this.protein,
    required this.fat,
    required this.carbohydrate,
    this.weight = 100,
  });

  Product operator *(double multiplier) {
    return Product(
      name: name,
      protein: protein * multiplier,
      fat: fat * multiplier,
      carbohydrate: carbohydrate * multiplier,
      weight: weight * multiplier,
    );
  }

  Product operator /(double multiplier) {
    return Product(
      name: name,
      protein: protein / multiplier,
      fat: fat / multiplier,
      carbohydrate: carbohydrate / multiplier,
      weight: weight / multiplier,
    );
  }
}

class ProductRequest {
  final String name;
  final double weight;

  const ProductRequest({
    required this.name,
    required this.weight,
  });
}