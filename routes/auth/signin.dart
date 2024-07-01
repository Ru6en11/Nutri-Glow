import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:nutri_glow/domain/entities/user/user.dart';
import 'package:nutri_glow/domain/entities/user/user_gateway.dart';
import 'package:nutri_glow/domain/entities/user/user_mapper.dart';
import 'package:nutri_glow/domain/interactors/signin/signin_boundary.dart';
import 'package:nutri_glow/domain/interactors/signin/signin_interactor.dart';
import 'package:nutri_glow/domain/service/auth_service.dart';

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
  
  try {
    final User user = UserMapper.fromJson(body);

    final AuthService authService = context.read<AuthService>(); 
    final UserGateway userGateway = context.read<UserGateway>();
    final SignInBoundary boundary = SignInInteractor(authService: authService, userGateway: userGateway);

    final String token = boundary.execute(user);

    return Response.json(body: {"token": token});
  } catch (e) { //TODO Re-write with concreate exception
    print(e);
    return Response(body: 'Invalid input', statusCode: 400);
  }
}
