import 'package:flutter/material.dart';
import 'package:ite_app/pages/home_page.dart';
import 'package:ite_app/pages/login.dart';
import 'package:ite_app/pages/register.dart';
import 'package:ite_app/pages/splash_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/login': (context) => Login(),
        '/register': (context) => Register(),
        '/home': (context) => HomePage(),
      },
    );
  }
}
