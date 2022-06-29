import 'package:animation/screens.dart/custom_bottom_shee.dart';
import 'package:animation/screens.dart/custom_drower.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const MaterialApp(
        home: CustomDrower(),
        debugShowCheckedModeBanner: false,
      );
}
