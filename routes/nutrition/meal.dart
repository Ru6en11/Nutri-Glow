import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:nutri_glow/domain/entities/meal/meal.dart';
import 'package:nutri_glow/domain/entities/meal/meal_mapper.dart';
import 'package:nutri_glow/domain/entities/product/product_gateway.dart';
import 'package:nutri_glow/domain/interactors/meal_nutrition/meal_nutrition_boundary.dart';
import 'package:nutri_glow/domain/interactors/meal_nutrition/meal_nutrition_interactor.dart';


Future<Response> onRequest(RequestContext context) {
  final HttpMethod method = context.request.method;

  return switch (method) {
    HttpMethod.get => _onGet(context),
    _ => Future.value(Response(statusCode: HttpStatus.methodNotAllowed)),
  };
}

Future<Response> _onGet(RequestContext context) async {
  final List<dynamic> body =
      (await context.request.json()) as List<dynamic>;

  final List<MealRequest> meals = body.map((json) => MealRequestMapper.fromJson(json)).toList();
  print(meals);
  final ProductGateway productGateway = context.read<ProductGateway>();
  final MealNutritionBoundary boundary = MealNutritionInteractor(productGateway);

  final List<Map<String, dynamic>> productJson = await boundary.execute(meals);

  return Response.json(body: productJson);
}
