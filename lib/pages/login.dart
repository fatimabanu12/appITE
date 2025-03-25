import 'package:flutter/material.dart';
import 'package:ite_app/widgets/custom_elevated_buttom.dart';
import 'package:ite_app/widgets/custom_login_form.dart';
import 'package:ite_app/widgets/custom_text_button.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _Login();
}

class _Login extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff2f6f7),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Iniciar Sesion',
              style: TextStyle(fontSize: 40),
            ),
            SizedBox(
              height: 50,
            ),
            CustomLoginForm(
                text: 'Correo electronico*'), //  hice uso del widget
            SizedBox(
              height: 10,
            ),
            CustomLoginForm(text: 'Contraseña*'),
            Column(
              children: [
                CustomTextButton(
                  text: '¿Olvidaste tu contraseña?',
                  route: '/password',
                  aligment: Alignment.centerRight,
                )
              ],
            ),
            CustomElevatedButtom(route: '/home', text: 'Ingresar'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('¿Aun no tienes cuenta?'),
                CustomTextButton(text: 'Registrate', route: '/register')
              ],
            ),
          ],
        ),
      ),
    );
  }
}
