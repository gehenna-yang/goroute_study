import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:goroutestudy/screen/1_screen.dart';
import 'package:goroutestudy/screen/2_screen.dart';
import 'package:goroutestudy/screen/3_screen.dart';
import 'package:goroutestudy/screen/error_screen.dart';
import 'package:goroutestudy/screen/home_screen.dart';

void main() {
  runApp(_App());
}

class _App extends StatelessWidget {
  _App({Key? key}) : super(key: key);

  final GoRouter _router = GoRouter(
    initialLocation: '/',
    errorBuilder: (context, state) {
      return ErrorScreen(error: state.error.toString());
    },
    routes: [
      GoRoute(
        path: '/',
        builder: (_, state) => HomeScreen(),
        routes: [
          GoRoute(
            path: 'one',
            builder: (_, state) => OneScreen(),
            routes: [
              GoRoute(
                path: 'two',
                name: TwoScreen.routeName,
                builder: (_, state) => TwoScreen(),
              ),
              GoRoute(
                path: 'three',
                name: ThreeScreen.routeName,
                builder: (_, state) => ThreeScreen(),
              ),
            ]
          ),
        ]
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      // route 정보를 전달
      routeInformationProvider: _router.routeInformationProvider,
      // URI String을 상태 및 Go Router에서 사용할 수 있는 형태로 변환해주는 함수
      routeInformationParser: _router.routeInformationParser,
      // 위에서 변경된 값으로 실제 어떤 라우트를 보여줄지 정하는 함수
      routerDelegate: _router.routerDelegate,
    );
  }
}
