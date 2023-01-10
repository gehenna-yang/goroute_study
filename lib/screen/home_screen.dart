import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:goroutestudy/layout/default_layout.dart';
import 'package:goroutestudy/screen/3_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                context.goNamed(ThreeScreen.routeName);
              },
              child: Text('Screen THREE')
          ),
        ],
      ),
    );
  }
}
