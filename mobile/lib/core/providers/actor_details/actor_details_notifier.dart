import 'package:alyamamah/core/models/actor_details.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final actorDetailsProvider =
    NotifierProvider<ActorDetailsNotifier, ActorDetails?>(
  () => ActorDetailsNotifier(),
);

class ActorDetailsNotifier extends Notifier<ActorDetails?> {
  ActorDetails? get actorDetails => state;
  void setActorDetails(ActorDetails? actorDetails) {
    state = actorDetails;
  }

  @override
  ActorDetails? build() {
    return null;
  }
}
