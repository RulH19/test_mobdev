import 'package:go_router/go_router.dart';
import 'package:test_mobdev/data/response/audio_response.dart';
import 'package:test_mobdev/screen/features/audio/pages/audio_play_screen.dart';
import 'package:test_mobdev/screen/features/audio/pages/audio_screen.dart';
import 'package:test_mobdev/screen/features/course/pages/course_screen.dart';
import 'package:test_mobdev/screen/features/home/pages/home_screen.dart';
import 'package:test_mobdev/screen/features/login/pages/login_screen.dart';
import 'package:test_mobdev/screen/features/onboard/on_board_screen.dart';
import 'package:test_mobdev/util/widgets/bottom_navigation.dart';
part 'route_name.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: RouteName.onboard,
      builder: (context, state) => const OnBoardScreen(),
    ),

    GoRoute(
      path: '/login',
      name: RouteName.login,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/home',
      name: RouteName.home,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/bottomNavigation',
      name: RouteName.bottomNavigation,
      builder: (context, state) => const BottomNavigation(),
      routes: [
        GoRoute(
          path: '/courses',
          name: RouteName.courses,
          builder: (context, state) => const CourseScreen(),
        ),
        GoRoute(
          path: '/audioBook',
          name: RouteName.audioBook,
          builder: (context, state) => const AudioScreen(),
          routes: [
            GoRoute(
              path: '/audioBookPlayer',
              name: RouteName.audioBookPlayer,
              builder: (context, state) {
                final audioResponse = state.extra as AudioResponse;
                return AudioPlayScreen(audioResponse: audioResponse);
              },
            ),
          ],
        ),
      ],
    ),
  ],
);
