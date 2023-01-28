import 'package:alyamamah/core/models/service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Service |', () {
    test(
      'can be created from map.',
      () {
        final service = Service.fromMap({
          'serviceId': '123',
          'enabled': '1',
        });
        expect(service.serviceId, equals('123'));
        expect(service.enabled, equals(true));
      },
    );

    test(
      'can be created from json.',
      () {
        final service = Service.fromJson('{"serviceId":"123","enabled":"1"}');
        expect(service.serviceId, equals('123'));
        expect(service.enabled, equals(true));
      },
    );

    test(
      'can be converted to map.',
      () {
        const service = Service(serviceId: '123', enabled: true);
        expect(
          service.toMap(),
          equals({
            'serviceId': '123',
            'enabled': '1',
          }),
        );
      },
    );

    test(
      'can be converted to json.',
      () {
        const service = Service(serviceId: '123', enabled: true);
        expect(service.toJson(), equals('{"serviceId":"123","enabled":"1"}'));
      },
    );

    test(
      'can be copied with changing serviceId and enabled.',
      () {
        const service = Service(serviceId: '123', enabled: true);
        final copy = service.copyWith(serviceId: '321', enabled: false);
        expect(copy, isNot(same(service)));
        expect(copy, equals(const Service(serviceId: '321', enabled: false)));
      },
    );

    test(
      'can copied with without changing anything.',
      () {
        const service = Service(serviceId: '123', enabled: true);
        final copy = service.copyWith();
        expect(copy, isNot(same(service)));
        expect(copy, equals(const Service(serviceId: '123', enabled: true)));
      },
    );

    test(
      'verify toString behavior.',
      () {
        const service1 = Service(serviceId: '123', enabled: true);

        expect(service1.toString(), 'Service(serviceId: 123, enabled: true)');
      },
    );

    test(
      'is equal to another service with the same serviceId and enabled.',
      () {
        const service1 = Service(serviceId: '123', enabled: true);
        const service2 = Service(serviceId: '123', enabled: true);
        expect(service1, equals(service2));
      },
    );

    test(
      'has a consistent hash code.',
      () {
        const service = Service(serviceId: '123', enabled: true);
        expect(service.hashCode,
            equals(const Service(serviceId: '123', enabled: true).hashCode));
      },
    );
  });
}
