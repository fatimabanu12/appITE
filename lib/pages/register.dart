import 'package:flutter/material.dart';
import 'package:ite_app/colors.dart';


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
  final TextEditingController _controlNumberController = TextEditingController();
  String? _selectedProgram;
  final List<String> _programs = [
    'Ingeniería en Sistemas Computacionales',
    'Ingeniería en Electrónica',
    'Ingeniería en Electromecánica',
    'Ingeniería en Mecatrónica',
    'Ingeniería Industrial',
    'Ingeniería en Innovación Agrícola',
    'Licenciatura en Administración',
  ];

  bool _isEmailValid(String email) {
    return email.endsWith('@ite.edu.mx');
  }

  void _register() {
    String firstName = _firstNameController.text;
    String lastName = _lastNameController.text;
    String email = _emailController.text;
    String controlNumber = _controlNumberController.text;

    if (firstName.isEmpty || lastName.isEmpty || controlNumber.isEmpty || email.isEmpty || _passwordController.text.isEmpty) {
      setState(() {
        _errorMessage = 'Por favor, complete todos los campos requeridos.';
      });
      return;
    }
    if (_isEmailValid(email)) {
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
      backgroundColor: AppColors.background,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 10), // Add space above the title
            Text(
              'Crear Cuenta',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.primary),
            ),
            SizedBox(height: 20), // Space between title and input fields
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _firstNameController,
                    decoration: InputDecoration(
                      labelText: 'Nombre',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      filled: true,
                      fillColor: AppColors.background,
                    ),
                  ),
                ),
                SizedBox(width: 10), // Add space between the fields
                Expanded(
                  child: TextField(
                    controller: _lastNameController,
                    decoration: InputDecoration(
                      labelText: 'Apellido',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      filled: true,
                      fillColor: AppColors.background,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10), // Padding between name fields and control number field
            TextField(
              controller: _controlNumberController,
              decoration: InputDecoration(
                labelText: 'Número de Control',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
                fillColor:  AppColors.background,
              ),
            ),
            SizedBox(height: 10), // Padding between control number and email fields
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Correo Electrónico',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
                fillColor: AppColors.background,
              ),
            ),
            SizedBox(height: 10), // Padding between email and password fields
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Contraseña',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
                fillColor:  AppColors.background,
              ),
              obscureText: true,
            ),
            SizedBox(height: 10), // Padding between password and dropdown
            DropdownButtonFormField<String>(
              value: _selectedProgram,
              hint: Text('Seleccione una carrera'),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedProgram = newValue;
                });
              },
              items: _programs.map<DropdownMenuItem<String>>((String program) {
                return DropdownMenuItem<String>(
                  value: program,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                    child: Text(program),
                  ),
                );
              }).toList(),
              isExpanded: true,
              decoration: InputDecoration(
                filled: true,
                fillColor: AppColors.background,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 20), // Padding before the button
            ElevatedButton(
              onPressed: _register,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary, // Background color
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30), // Padding
              ),
              child: Text('Registrar', style: TextStyle( color: AppColors.secondary),
              )
            ),
            if (_errorMessage != null) 
              Text(_errorMessage!, style: TextStyle(color: Colors.red)),
          ],
        ),
      ),
    );
  }
}
