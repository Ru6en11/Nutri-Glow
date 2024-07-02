import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:nutri_glow/domain/entities/anthropometric_data/anthropometric_gateway.dart';
import 'package:nutri_glow/domain/interactors/calorie_intake/calorie_intake_boundary.dart';
import 'package:nutri_glow/domain/interactors/calorie_intake/calorie_intake_interactor.dart';

Future<Response> onRequest(RequestContext context) async {
  final HttpMethod method = context.request.method;

  return switch (method) {
    HttpMethod.post => _onPost(context),
    _ => Future.value(Response(statusCode: HttpStatus.methodNotAllowed)),
  };
}

Future<Response> _onPost(RequestContext context) async {
  final Map<String, dynamic> body =
      (await context.request.json()) as Map<String, dynamic>;
  final String? userId = body["user_id"] as String?;

  if (userId == null) {
    return Response(statusCode: HttpStatus.badRequest);
  }

  final AnthropometricGateway anthropometricGateway =
      context.read<AnthropometricGateway>();
  final CalorieIntakeBoundary boundary =
      CalorieIntakeInteractor(anthropometricGateway);

  final Map<String, dynamic> bmr = boundary.execute(userId);

  return Response.json(body: bmr);
}
