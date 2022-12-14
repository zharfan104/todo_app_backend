import 'package:dart_frog/dart_frog.dart';
import 'package:todo_app_backend/core/helpers/constant_helper.dart';

enum ContentType { json, formData, formUrlEncoded }

class ContentTypeHelper {
  const ContentTypeHelper._();

  static ContentType identify(RequestContext context) {
    if (context.request.headers['content-type'] == ConstantHelper.contentTypeJSON) {
      return ContentType.json;
    } else {
      return ContentType.formUrlEncoded;
    }
  }
}
