import 'dart:convert';
import 'dart:io';
import 'package:shelf_router/shelf_router.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as io;


Future<void> main() async {
  var app = Router();

  // Route 
  app.get('/', (Request request) async {
    return Response.ok('Hello world from Dart!');
  });

  // Route for health check
  app.get('/healthz', (Request request) async {
    return Response.ok('Healthy');
  });

  var port = int.parse(Platform.environment['PORT'] ?? '8080');
  var server = await io.serve(app, InternetAddress.anyIPv4, port);
  print('Serving at http://${server.address.host}:${server.port}');
}