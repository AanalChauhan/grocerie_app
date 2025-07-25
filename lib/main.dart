import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:grocerie_app/constants/app_theme.dart';
import 'package:grocerie_app/provider/application_provider.dart';
import 'package:grocerie_app/provider/auth_provider.dart';
import 'package:grocerie_app/views/boarding_screen.dart';
import 'package:grocerie_app/widgets/Bottom_navbar.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_)=>AuthProvider()),
    ChangeNotifierProvider(create: (_) => ApplicationProvider())],
    child: MyApp(),));
  }

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
     final authProvider = Provider.of<AuthProvider>(context);
    return  MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Groceerie Demooo',
        home:  authProvider.user != null ? BottomNavbar() : BoardingScreen(),
        theme: AppTheme.lightTheme,
      );
  }
}
