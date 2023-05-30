// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main.dart';

// **************************************************************************
// ShelfRouterGenerator
// **************************************************************************

Router _$ServiceRouter(Service service) {
  final router = Router();
  router.add(
    'GET',
    r'/say-hi/<name>',
    service.sayHi,
  );
  router.add(
    'GET',
    r'/user/<userId|[0-9]+>',
    service.showUser,
  );
  router.add(
    'GET',
    r'/<ignored|.*>',
    service.notFound,
  );
  return router;
}
