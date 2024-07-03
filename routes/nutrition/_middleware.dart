import 'package:dart_frog/dart_frog.dart';
import 'package:nutri_glow/data/gateway/usda_product_gateway.dart';
import 'package:nutri_glow/domain/entities/product/product_gateway.dart';

Handler middleware(Handler handler) {
  return handler.use(
    provider<ProductGateway>((_) => UsdaProductGateway())
  );
}
