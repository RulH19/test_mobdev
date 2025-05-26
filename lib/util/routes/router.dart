import 'package:go_router/go_router.dart';
import 'package:test_mobdev/data/response/audio_response.dart';
import 'package:test_mobdev/data/response/course_response.dart';
import 'package:test_mobdev/screen/features/audio/pages/audio_play_screen.dart';
import 'package:test_mobdev/screen/features/audio/pages/audio_screen.dart';
import 'package:test_mobdev/screen/features/course/pages/course_screen.dart';
import 'package:test_mobdev/screen/features/course/pages/detail_course_player_screen.dart';
import 'package:test_mobdev/screen/features/course/pages/detail_course_screen.dart';
import 'package:test_mobdev/screen/features/home/pages/home_screen.dart';
import 'package:test_mobdev/screen/features/login/pages/login_screen.dart';
import 'package:test_mobdev/screen/features/onboard/on_board_screen.dart';
import 'package:test_mobdev/util/routes/app_navigator_observer.dart';
import 'package:test_mobdev/util/routes/audio_argument.dart';
import 'package:test_mobdev/util/widgets/bottom_navigation.dart';
part 'route_name.dart';

final router = GoRouter(
  observers: [AppNavigatorObserver()],
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
          routes: [
            GoRoute(
              path: 'courseDetail',
              name: RouteName.courseDetail,
              builder: (context, state) {
                final courseResponse = state.extra as CourseResponse;
                return DetailCourseScreen(courseResponse: courseResponse);
              },
              routes: [
                GoRoute(
                  path: 'courseDetailPlayer',
                  name: RouteName.courseDetailPlayer,
                  builder: (context, state) => const DetailCoursePlayerScreen(),
                ),
              ],
            ),
          ],
        ),
        GoRoute(
          path: 'audioBook',

          name: RouteName.audioBook,
          builder: (context, state) => const AudioScreen(),
          routes: [
            GoRoute(
              path: 'audioBookPlayer',
              name: RouteName.audioBookPlayer,
              builder: (context, state) {
                final args = state.extra as AudioArgument;
                return AudioPlayScreen(
                  audioListResponse: args.audioList,
                  currentIndex: args.currentIndex,
                );
              },
            ),
          ],
        ),
      ],
    ),
  ],
);
