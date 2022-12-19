import 'package:dart_frog/dart_frog.dart';
import 'package:todo_app_backend/core/helpers/response_helper.dart';
import 'package:todo_app_backend/core/jwt/jwt_service.dart';
import 'package:todo_app_backend/di.dart';

const _authenticationUrl = ['user/login', 'user/register'];

Handler middleware(Handler handler) {
  return handler.use(requestLogger()).use(_verifyTokenHandler);
}

Handler _verifyTokenHandler(Handler handler) {
  return (context) async {
    final middleWare = sl<JwtService>();
    final isTokenVerified = await middleWare.verifyToken(context);
    final url = context.request.url.toString();
    final isAuthenticationUrl = _authenticationUrl.contains(url);
    final isNeedVerifiedToken = !isAuthenticationUrl;

    if (isNeedVerifiedToken) {
      if (!isTokenVerified) {
        return ResponseHelper.unAuthorized();
      }
    }

    Response response;

    try {
      response = await handler(context);
    } catch (error) {
      return ResponseHelper.badRequest(
        message: 'Bad Request ($error)',
      );
    }

    return response;
  };
}
