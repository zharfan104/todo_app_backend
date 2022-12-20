import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import '../../routes/task/index.dart' as task_with_index_route;

class _MockRequestContext extends Mock implements RequestContext {}

final _mockUri = Uri.parse('https://this-is-a-mock.url/');

void main() {
  group('PUT /task/[id]', () {
    test('responds with a 405 (method not allowed)".', () async {
      final context = _MockRequestContext();

      when(() => context.request).thenReturn(Request.put(_mockUri));

      final response = await task_with_index_route.onRequest(context);
      expect(response.statusCode, equals(HttpStatus.methodNotAllowed));
    });
  });
}
