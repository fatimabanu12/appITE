import 'package:flutter/material.dart';
import 'package:ite_app/widgets/custom_elevated_buttom.dart';
import 'package:ite_app/widgets/custom_login_form.dart';

class PasswordPage extends StatefulWidget {
  const PasswordPage({super.key});

  @override
  State<PasswordPage> createState() => _PasswordPageState();
}

class _PasswordPageState extends State<PasswordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios)),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 60),
              child: Text(
                'Restablece tu \n contraseña',
                style: TextStyle(fontSize: 40),
              ),
            ),

            SizedBox(
              height: 100,
            ),
            CustomLoginForm(
                text: 'Correo electronico*'), //  hice uso del widget
            SizedBox(
              height: 10,
            ),
            CustomElevatedButtom(route: '/password2', text: 'Enviar')
          ],
        )));
  }
}
