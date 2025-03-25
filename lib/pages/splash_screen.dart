import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _HomePageState();
}

class _HomePageState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff2f6f7),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('lib/images/ite.png'),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/login');
                },
                style: ElevatedButton.styleFrom(
                    //darle forma al boton y no se quede con lo que viene por defecto
                    backgroundColor: Color(0xff2b3a67),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    padding:
                        EdgeInsets.symmetric(horizontal: 100, vertical: 10)),
                child: Text('Iniciar sesion')),
          ],
        ),
      ),
    );
  }
}
