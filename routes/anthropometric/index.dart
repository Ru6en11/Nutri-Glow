import 'dart:developer';
import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:nutri_glow/domain/entities/anthropometric_data/anthropometric_data.dart';
import 'package:nutri_glow/domain/entities/anthropometric_data/anthropometric_data_mapper.dart';
import 'package:nutri_glow/domain/entities/anthropometric_data/anthropometric_gateway.dart';

Future<Response> onRequest(RequestContext context) {
  final HttpMethod method = context.request.method;

  return switch (method) {
    HttpMethod.post => _onPost(context),
    _ => Future.value(Response(statusCode: HttpStatus.methodNotAllowed)),
  };
}

Future<Response> _onPost(RequestContext context) async {
  final Map<String, dynamic> body = (await context.request.json()) as Map<String, dynamic>;

  final AnthropometricGateway anthropometricGateway = context.read<AnthropometricGateway>();

  try {

    final AnthropometricData data = AnthropometricDataMapper.fromJson(body);
    anthropometricGateway.save(data);

    final Map<String, dynamic> json = AnthropometricDataMapper.toJson(data);

    return Response.json(body: json);
  } catch (e) {
    log(e.toString());

    return Response(statusCode: HttpStatus.badRequest);
  }

}