import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_mobdev/screen/features/audio/bloc/audio_player/audio_player_qubit.dart';
import 'package:test_mobdev/util/routes/router.dart';

class AppNavigatorObserver extends RouteObserver<PageRoute<dynamic>> {
  @override
  void didPop(Route route, Route? previousRoute) {
    if (route.settings.name == RouteName.audioBookPlayer) {
      final cubit = previousRoute?.navigator?.context.read<AudioPlayerQubit>();
      cubit?.stop();
    }
  }
}
