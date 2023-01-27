import 'package:alyamamah/ui/views/startup/startup_view.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'yu_router.gr.dart';

// export 'yu_router.gr.dart';

final yuRouterProvider = Provider<YURouter>((ref) => YURouter());

@AdaptiveAutoRouter(
  replaceInRouteName: 'View,Route',
  routes: [
    AdaptiveRoute(page: StartupView, initial: true),
  ],
)
class $YURouter {}
