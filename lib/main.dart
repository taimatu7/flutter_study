import 'dart:async' show Future;
import 'dart:io';

import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;
import 'package:shelf_router/shelf_router.dart';

part 'main.g.dart';

class Service {
  @Route.get('/say-hi/<name>')
  Future<Response> sayHi(Request request, String name) async {
    return Response.ok('Hi $name');
  }

  @Route.get('/user/<userId|[0-9]+>')
  Future<Response> showUser(Request request, String userId) async {
    return Response.ok('User $userId');
  }

  @Route.get('/<ignored|.*>')
  Future<Response> notFound(Request request) async {
    return Response.notFound('Page not found');
  }

  Handler get handler => _$ServiceRouter(this);
}

void main() async {
  final service = Service();
  final server = await shelf_io.serve(service.handler, 'localhost', 8080);

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
