import 'dart:convert';
import 'dart:io';

import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;
import 'package:shelf_router/shelf_router.dart' as shelf_router;
import 'package:shelf_static/shelf_static.dart' as shelf_static;

Future main() async {
  final port = int.parse(Platform.environment['PORT'] ?? '8080');
  final cascade = Cascade()
      .add(_staticHandler)
      .add(_router);

  final server = await shelf_io.serve(
    logRequests()
        .addHandler(cascade.handler),
    InternetAddress.anyIPv4, 
    port,
  );
  print('Serving at http://${server.address.host}:${server.port}');
}

final _staticHandler = 
    shelf_static.createStaticHandler('public', defaultDocument: 'index.html');

final _router = shelf_router.Router()
  ..get('/helloworld', _helloWorldHandler)
  ..get(
    '/time',
    (request) => Response.ok(DateTime.now().toUtc().toIso8601String()),
  )
  ..get('/sum/<a|[0-9]+>/<b[0-9]+>', _sumHandler);

Response _helloWorldHandler(Request request) => Response.ok('Hello,world!');

Response _sumHandler(request, String a, String b) {
  final aNum = int.parse(a);
  final bNum = int.parse(b);
  return Response.ok(
    const JsonEncoder.withIndent(' ')
        .convert({'a': aNum, 'b': bNum, 'sum': aNum + bNum}),
    headers: {
      'content-type': 'application/json',
      'Cache-Control': 'public, max-age=604800',
    },
  );
}
