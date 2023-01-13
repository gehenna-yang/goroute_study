import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:goroutestudy/model/user_model.dart';
import 'package:goroutestudy/screen/1_screen.dart';
import 'package:goroutestudy/screen/2_screen.dart';
import 'package:goroutestudy/screen/3_screen.dart';
import 'package:goroutestudy/screen/error_screen.dart';
import 'package:goroutestudy/screen/home_screen.dart';
import 'package:goroutestudy/screen/login_screen.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final authStateProvider = AuthNotifier(ref: ref);

  return GoRouter(
    initialLocation: '/login',
    errorBuilder: (context, state) {
      return ErrorScreen(error: state.error.toString());
    },
    // redirect
    redirect: authStateProvider._redirectLogic,
    // refresh
    refreshListenable: authStateProvider,
    routes: authStateProvider._routes,
  );
});

class AuthNotifier extends ChangeNotifier {
  final Ref ref;

  AuthNotifier({
    required this.ref
  }) {
    ref.listen<UserModel?>(userProvider, (previous, next) {
      if(previous != next){
        notifyListeners();
      }
    });
  }

  String? _redirectLogic(GoRouterState state) {
    // usermodel instance or null
    final user = ref.read(userProvider);

    // login을 하려는 상태인지
    final loggingin = state.location == '/login';

    // 유저 정보가 없다 - 로그인 상태가 아님
    // 유저 정보가 없고 로그인 시도중이 아니라면 로그인페이지로 이동
    if(user == null){
      return loggingin ? null:'/login';
    }

    // 유저 정보가 있는데 로그인 페이지라면 홈으로 이동
    if(loggingin){
      return '/';
    }

    return null;

  }

  List<GoRoute> get _routes => [
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
    GoRoute(
      path: '/login',
      builder: (_, state) => LoginScreen(),
    ),
  ];
}

final userProvider = StateNotifierProvider<UserStateNotifier, UserModel?>((ref) => UserStateNotifier(),);

// 로그인한 상태면 UserModel 인스턴스 상태로 넣어주기
// 로그아웃 상태면 null 상태로 넣어주
class UserStateNotifier extends StateNotifier<UserModel?> {
  UserStateNotifier(): super(null);

  login({
    required String name,
  }){
    state = UserModel(name: name);
  }

  logout(){
    state = null;
  }
}