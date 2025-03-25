import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ite_app/colors.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _controlNumberController = TextEditingController();
  String? _selectedProgram;
  String? _errorMessage;

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

  Future<void> _register() async {
    String firstName = _firstNameController.text;
    String lastName = _lastNameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;
    String controlNumber = _controlNumberController.text;

    if (firstName.isEmpty || lastName.isEmpty || controlNumber.isEmpty || email.isEmpty || password.isEmpty || _selectedProgram == null) {
      setState(() {
        _errorMessage = 'Por favor, complete todos los campos requeridos.';
      });
      return;
    }

    if (!_isEmailValid(email)) {
      setState(() {
        _errorMessage = 'El correo electrónico debe terminar con @ite.edu.mx';
      });
      return;
    }

    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await FirebaseFirestore.instance.collection('users').doc(userCredential.user!.uid).set({
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'controlNumber': controlNumber,
        'program': _selectedProgram,
      });

      Navigator.pushReplacementNamed(context, '/login');
    } catch (e) {
      setState(() {
        _errorMessage = 'Error al registrar: ${e.toString()}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Text('Crear Cuenta', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: AppColors.primary)),
              SizedBox(height: 30),
              Row(
                children: [
                  Expanded(child: _buildTextField(_firstNameController, 'Nombre')),
                  SizedBox(width: 10),
                  Expanded(child: _buildTextField(_lastNameController, 'Apellido')),
                ],
              ),
              SizedBox(height: 15),
              _buildTextField(_controlNumberController, 'Número de Control'),
              SizedBox(height: 15),
              _buildTextField(_emailController, 'Correo Electrónico'),
              SizedBox(height: 15),
              _buildTextField(_passwordController, 'Contraseña', obscureText: true),
              SizedBox(height: 15),
              _buildDropdown(),
              SizedBox(height: 30),
              _buildRegisterButton(),
              if (_errorMessage != null)
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(_errorMessage!, style: TextStyle(color: Colors.red)),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label, {bool obscureText = false}) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: AppColors.primary),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColors.primary),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColors.primary, width: 2),
        ),
        filled: true,
        fillColor: AppColors.background,
      ),
    );
  }

  Widget _buildDropdown() {
    return DropdownButtonFormField<String>(
      value: _selectedProgram,
      hint: Text('Seleccione una carrera', style: TextStyle(color: AppColors.primary)),
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
            child: Text(program, style: TextStyle(color: AppColors.primary)),
          ),
        );
      }).toList(),
      isExpanded: true,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.background,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColors.primary),
        ),
      ),
    );
  }

  Widget _buildRegisterButton() {
    return ElevatedButton(
      onPressed: _register,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: Text('Registrar', style: TextStyle(color: AppColors.secondary, fontSize: 16)),
    );
  }
}
