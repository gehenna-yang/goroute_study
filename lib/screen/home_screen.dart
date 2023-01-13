import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:goroutestudy/layout/default_layout.dart';
import 'package:goroutestudy/provider/auth_provider.dart';
import 'package:goroutestudy/screen/2_screen.dart';
import 'package:goroutestudy/screen/3_screen.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultLayout(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ElevatedButton(
            onPressed: (){
              context.go('/one');
            },
            child: Text('Screen ONE')
          ),
          ElevatedButton(
              onPressed: (){
                // context.go('/one/two/three');
                context.goNamed(TwoScreen.routeName);
              },
              child: Text('Screen TWO')
          ),
          ElevatedButton(
              onPressed: (){
                // context.go('/one/two/three');
                context.goNamed(ThreeScreen.routeName);
              },
              child: Text('Screen THREE')
          ),
          ElevatedButton(
              onPressed: (){
                context.go('error');
              },
              child: Text('Error Screen')
          ),
          ElevatedButton(
              onPressed: (){
                context.go('/login');
              },
              child: Text('Login Screen')
          ),
          ElevatedButton(
              onPressed: (){
                ref.read(userProvider.notifier).logout();
              },
              child: Text('Logout')
          ),
        ],
      ),
    );
  }
}
