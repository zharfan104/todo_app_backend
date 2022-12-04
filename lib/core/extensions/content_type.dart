import 'package:dart_frog/dart_frog.dart';
import 'package:todo_app_backend/core/helpers/constant_helper.dart';

extension ContentTypeX on RequestContext {
  bool get contentTypeJSON => request.headers['content-type'] == ConstantHelper.contentTypeJSON;
}
