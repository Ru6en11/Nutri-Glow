import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:nutri_glow/domain/entities/product/product_gateway.dart';
import 'package:nutri_glow/domain/entities/product/product_mapper.dart';
import 'package:nutri_glow/domain/interactors/product_nutrition/product_nutrition_boundary.dart';
import 'package:nutri_glow/domain/interactors/product_nutrition/product_nutrition_interactor.dart';

Future<Response> onRequest(RequestContext context) {
  final HttpMethod method = context.request.method;

  return switch (method) {
    HttpMethod.get => _onGet(context),
    _ => Future.value(Response(statusCode: HttpStatus.methodNotAllowed)),
  };
}

Future<Response> _onGet(RequestContext context) async {
  final Map<String, dynamic> body =
      (await context.request.json()) as Map<String, dynamic>;
  final String? productName = body["product_name"] as String?;
  final int? productWeight = body["product_weight"] as int?;

  if (productName == null) {
    return Response(statusCode: HttpStatus.badRequest);
  } 

  final ProductGateway productGateway = context.read<ProductGateway>();
  final ProductNutritionBoundary boundary = ProductNutritionInteractor(productGateway);

  final Map<String, dynamic> productJson = await boundary.execute(productName, productWeight);

  return Response.json(body: productJson);
}
