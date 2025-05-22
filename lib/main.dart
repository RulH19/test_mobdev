import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_mobdev/data/api/api_service.dart';
import 'package:test_mobdev/screen/features/login/bloc/login_bloc.dart';
import 'package:test_mobdev/util/routes/router.dart';
import 'package:test_mobdev/util/widgets/bottom_nav_cubit.dart';

void main() {
  final apiService = ApiService();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(create: (_) => LoginBloc(apiService)),
        BlocProvider<BottomNavCubit>(create: (_) => BottomNavCubit()),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(scaffoldBackgroundColor: Colors.black),
      routerConfig: router,
    );
  }
}
