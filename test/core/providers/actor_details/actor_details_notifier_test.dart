import 'package:alyamamah/core/models/actor_details.dart';
import 'package:alyamamah/core/providers/actor_details/actor_details_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('actorDetailsProvider |', () {
    test(
      'should get a NotifierProvider<ActorDetailsNotifier, ActorDetails?>.',
      () {
        expect(
          actorDetailsProvider,
          isA<NotifierProvider<ActorDetailsNotifier, ActorDetails?>>(),
        );
      },
    );
  });

  group('ActorDetailsNotifier |', () {
    test(
      'should get null actor details by default.',
      () {
        final container = ProviderContainer();
        final notifier = container.read(actorDetailsProvider.notifier);

        expect(notifier.actorDetails, isNull);
      },
    );

    test(
      'should get null actor details when state is null.',
      () {
        final container = ProviderContainer();
        final notifier = container.read(actorDetailsProvider.notifier);

        notifier.setActorDetails(null);

        expect(notifier.actorDetails, isNull);
      },
    );

    test(
      'should get actor details when state is not null.',
      () {
        final container = ProviderContainer();
        final notifier = container.read(actorDetailsProvider.notifier);

        notifier.setActorDetails(FakeActorDetails());

        expect(notifier.actorDetails, isNotNull);
      },
    );
  });
}

class FakeActorDetails extends Fake implements ActorDetails {}
