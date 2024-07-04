import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:nutri_glow/domain/entities/product/product_gateway.dart';
import 'package:nutri_glow/domain/interactors/suggestion/suggestion_boundary.dart';
import 'package:nutri_glow/domain/interactors/suggestion/suggestion_interactor.dart';

Future<Response> onRequest(RequestContext context) async {
  final HttpMethod method = context.request.method;

  return switch (method) {
    HttpMethod.get => _onGet(context),
    _ => Future.value(Response(statusCode: HttpStatus.methodNotAllowed)),
  };
}

Future<Response> _onGet(RequestContext context) async {
  final Map<String, dynamic> body =
      (await context.request.json()) as Map<String, dynamic>;
  final String? nutrient = body["nutrient"] as String?;
  final double? amount = body["amount"] as double?;

  if (nutrient == null || amount == null) {
    return Response(statusCode: HttpStatus.badRequest);
  } 

  final ProductGateway productGateway = context.read<ProductGateway>();
  final SuggestionBoundary boundary = SuggestionInteractor(productGateway);
  final List<Map<String, dynamic>> productJson = await boundary.execute(nutrient, amount);

  return Response.json(body: productJson);
}
