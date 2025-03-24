import 'package:flutter/material.dart';
import 'package:ite_app/widgets/custom_elevated_buttom.dart';
import 'package:ite_app/widgets/custom_login_form.dart';

class PasswordPage2 extends StatefulWidget {
  const PasswordPage2({super.key});

  @override
  State<PasswordPage2> createState() => _PasswordPage2State();
}

class _PasswordPage2State extends State<PasswordPage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 60),
          child: Text(
            'Restablecer \n contraseña',
            style: TextStyle(fontSize: 40),
          ),
        ),

        SizedBox(
          height: 100,
        ),
        CustomLoginForm(text: 'Nueva contraseña*'), //  hice uso del widget
        SizedBox(
          height: 10,
        ),
        Text('longitud minima (8-12 caracteres)'),
        Text('Uso de mayusculas y minusculas'),
        SizedBox(
          height: 10,
        ),
        CustomLoginForm(text: 'Confirmar contraseña'),
        CustomElevatedButtom(route: '/login', text: 'Guardar')
      ],
    )));
  }
}
