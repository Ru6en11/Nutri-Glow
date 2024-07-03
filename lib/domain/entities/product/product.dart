
class Product {
  final String name;
  final double protein;
  final double fat;
  final double carbohydrate;

  const Product({
    required this.name,
    required this.protein,
    required this.fat,
    required this.carbohydrate,
  });

  Product operator *(double multiplier) {
    return Product(
      name: name,
      protein: protein * multiplier,
      fat: fat * multiplier,
      carbohydrate: carbohydrate * multiplier,
    );
  }

  Product operator /(double multiplier) {
    return Product(
      name: name,
      protein: protein / multiplier,
      fat: fat / multiplier,
      carbohydrate: carbohydrate / multiplier,
    );
  }
}