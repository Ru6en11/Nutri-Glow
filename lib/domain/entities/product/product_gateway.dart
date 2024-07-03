
import 'package:nutri_glow/domain/entities/product/product.dart';

abstract class ProductGateway {

  Future<Product> findOneByName(String productName); 

}