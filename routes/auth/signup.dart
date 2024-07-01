import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:nutri_glow/domain/entities/user/user_gateway.dart';
import 'package:nutri_glow/domain/interactors/signup/signup_interactor.dart';
import 'package:nutri_glow/domain/service/auth_service.dart';

Future<Response> onRequest(RequestContext context) async {
  final HttpMethod method = context.request.method;

  return switch (method) {
    HttpMethod.post => _onPost(context),
    _ => Future.value(Response(statusCode: HttpStatus.methodNotAllowed)),
  };
}

Future<Response> _onPost(RequestContext context) async {
  final Map<String, dynamic> body = (await context.request.json()) as Map<String, dynamic>;
  final String? login = body['login'] as String?;
  final String? password = body['password'] as String?;

  if (login == null || password == null) {
    return Response(statusCode: HttpStatus.badRequest);
  }

  final UserGateway userGateway = context.read<UserGateway>();
  final AuthService authService = context.read<AuthService>();
  final SignUpInteractor interactor = SignUpInteractor(userGateway: userGateway, authService: authService);

  try {
    final Map<String, dynamic> newUserJson = interactor.execute(login, password);

    print(newUserJson);
    return Response.json(body: newUserJson);
  } catch (e) {
    return Response(statusCode: HttpStatus.badRequest);
  }
  
}