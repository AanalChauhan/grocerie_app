import 'package:flutter/material.dart';
import 'package:grocerie_app/constants/app_theme.dart';
import 'package:grocerie_app/views/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Groceerie Demooo',
      home: SplashScreen(),
      theme: AppTheme.lightTheme,
    );
  }
}
