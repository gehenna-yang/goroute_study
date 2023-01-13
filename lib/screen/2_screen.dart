import 'package:flutter/material.dart';
import 'package:goroutestudy/layout/default_layout.dart';

class TwoScreen extends StatelessWidget {
  static String get routeName => 'two';
  const TwoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      body: Column(
        children: [
        ],
      ),
    );
  }
}
