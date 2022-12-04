import 'package:dart_frog/dart_frog.dart';

extension RequestMethodX on RequestContext {
  bool get httpMethodGet => request.method == HttpMethod.get;
  bool get httpMethodPost => request.method == HttpMethod.post;
  bool get httpMethodPut => request.method == HttpMethod.put;
  bool get httpMethodDelete => request.method == HttpMethod.delete;
  bool get httpMethodOptions => request.method == HttpMethod.options;
}
