import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String? _errorMessage;
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _controlNumberController =
      TextEditingController();

  bool _isEmailValid(String email) {
    return email.endsWith('@ite.edu.mx');
  }

  void _register() {
    String firstName = _firstNameController.text;
    String lastName = _lastNameController.text;
    String email = _emailController.text;
    String controlNumber = _controlNumberController.text;

    if (firstName.isEmpty || lastName.isEmpty || controlNumber.isEmpty) {
      setState(() {
        _errorMessage = 'Por favor, complete todos los campos requeridos.';
      });
      return;
    }
    if (_isEmailValid(email)) {
      // Handle registration logic here
      // Handle registration logic here
      Navigator.pushReplacementNamed(context, '/login');
    } else {
      setState(() {
        _errorMessage = 'El correo electrónico debe terminar con @ite.edu.mx';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _firstNameController,
              decoration: InputDecoration(
                labelText: 'Nombre',
                errorText: _errorMessage,
              ),
            ),
            TextField(
              controller: _lastNameController,
              decoration: InputDecoration(
                labelText: 'Apellido',
                errorText: _errorMessage,
              ),
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Correo Electrónico',
                errorText: _errorMessage,
              ),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Contraseña',
              ),
              obscureText: true,
            ),
            TextField(
              controller: _controlNumberController,
              decoration: InputDecoration(
                labelText: 'Número de Control',
                errorText: _errorMessage,
              ),
            ),
            
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _register,
              child: Text('Registrar'),
            ),
          ],
        ),
      ),
    );
  }
}
