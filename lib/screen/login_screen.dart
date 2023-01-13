import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:goroutestudy/layout/default_layout.dart';
import 'package:goroutestudy/provider/auth_provider.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultLayout(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ElevatedButton(
            onPressed: (){
              ref.read(userProvider.notifier).login(name: 'Code Factory');
            },
            child: Text('Login')
          ),
        ],
      ),
    );
  }
}
