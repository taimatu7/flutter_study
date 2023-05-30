import 'dart:async' show Future;
import 'dart:io';

import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;
import 'package:shelf_router/shelf_router.dart';

class Service {
  Handler get handler {
    final router = Router();

    router.get('/say-hi/<name>', (Request request, String name) {
      return Response.ok('hi $name');
    });

    router.get('/user/<userId|[0-9]+>', (Request request, String userId) {
      return Response.ok('User has the user-number: $userId');
    });

    router.get('/wave', (Request request) async {
      await Future<void>.delayed(const Duration(milliseconds: 100));
      return Response.ok('_o/');
    });

    router.get('/api/', Api().router);

    router.all('/<ignored|.*>', (Request request) {
      Response.notFound('not found');
    });

    return router;
  }
}

class Api {
  Future<Response> _messages(Request request) async {
    return Response.ok([]);
  }

  Router get router {
    final router = Router();

    router.get('/messages', _messages);
    router.get('/messages/', _messages);

    router.all('/<ignored|.*>', (Request request) {
      Response.notFound('not found');
    });

    return router;
  }
}

void main() async {
  final service = Service();
  final server = await shelf_io.serve(service.handler, '0.0.0.0', 8080);

  final addresses = await NetworkInterface.list(
      includeLoopback: false, type: InternetAddressType.IPv4);

  for (var interface in addresses) {
    for (var addr in interface.addresses) {
      if (addr.type == InternetAddressType.IPv4 && !addr.isLoopback) {
        print('Local IP Address: ${addr.address}');
      }
    }
  }
}
