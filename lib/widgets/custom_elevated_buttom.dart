import 'package:flutter/material.dart';

class CustomElevatedButtom extends StatelessWidget {
  final String route;
  final String text;

  const CustomElevatedButtom(
      {required this.route, required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushReplacementNamed(context, route); //route = "/sdkskd"
      },
      style: ElevatedButton.styleFrom(
          //darle forma al boton y no se quede con lo que viene por defecto
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          padding: EdgeInsets.symmetric(horizontal: 160, vertical: 10)),
      child: Text(text),
    );
  }
}
