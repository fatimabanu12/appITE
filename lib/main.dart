import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ite_app/firebase_options.dart';
import 'package:ite_app/pages/home_page.dart';
import 'package:ite_app/pages/login.dart';
import 'package:ite_app/pages/password_page.dart';
import 'package:ite_app/pages/password_page2.dart';
import 'package:ite_app/pages/register.dart';
import 'package:ite_app/pages/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
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
        '/password': (context) => PasswordPage(),
        '/password2': (context) => PasswordPage2(),
      },
    );
  }
}
