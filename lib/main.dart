import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/joke_provider.dart';
import 'view/splash_screen.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => JokesProvider(), child: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
    );
  }
}
