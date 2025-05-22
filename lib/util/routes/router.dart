import 'package:go_router/go_router.dart';
import 'package:test_mobdev/screen/features/home/pages/home_screen.dart';
import 'package:test_mobdev/screen/features/login/pages/login_screen.dart';
import 'package:test_mobdev/screen/features/onboard/on_board_screen.dart';
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
  ],
);
