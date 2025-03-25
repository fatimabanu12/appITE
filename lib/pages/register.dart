import 'package:flutter/material.dart';
import 'package:ite_app/colors.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _controlNumberController = TextEditingController();

  String? _selectedProgram;
  bool _obscurePassword = true;

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
    if (_formKey.currentState!.validate()) {
      // Si todo está validado, proceder con el registro.
      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _controlNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                Text(
                  'Crear Cuenta',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: AppColors.primary),
                ),
                const SizedBox(height: 30),
                Row(
                  children: [
                    Expanded(child: _buildTextField(_firstNameController, 'Nombre')),
                    const SizedBox(width: 10),
                    Expanded(child: _buildTextField(_lastNameController, 'Apellido')),
                  ],
                ),
                const SizedBox(height: 15),
                _buildTextField(_controlNumberController, 'Número de Control'),
                const SizedBox(height: 15),
                _buildDropdown(),
                const SizedBox(height: 15),
                _buildTextField(_emailController, 'Correo Electrónico', validator: (value) {
                  if (value == null || value.isEmpty) return 'Campo requerido';
                  if (!_isEmailValid(value)) return 'Debe usar un correo @ite.edu.mx';
                  return null;
                }),
                const SizedBox(height: 15),
                _buildPasswordTextField(),
                
                const SizedBox(height: 30),
                _buildRegisterButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label, {String? Function(String?)? validator}) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: AppColors.primary),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        filled: true,
        fillColor: AppColors.background,
      ),
      validator: validator ?? (value) {
        if (value == null || value.isEmpty) return 'Campo requerido';
        return null;
      },
    );
  }

  Widget _buildPasswordTextField() {
    return TextFormField(
      controller: _passwordController,
      obscureText: _obscurePassword,
      decoration: InputDecoration(
        labelText: 'Contraseña',
        labelStyle: TextStyle(color: AppColors.primary),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        filled: true,
        fillColor: AppColors.background,
        suffixIcon: IconButton(
          icon: Icon(_obscurePassword ? Icons.visibility_off : Icons.visibility, color: AppColors.primary),
          onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) return 'Campo requerido';
        if (value.length < 6) return 'Debe tener al menos 6 caracteres';
        return null;
      },
    );
  }

  Widget _buildDropdown() {
  return DropdownButtonFormField<String>(
    value: _selectedProgram, // Se asegura de que el valor seleccionado sea visible
    onChanged: (String? newValue) {
      setState(() {
        _selectedProgram = newValue; // Actualiza el estado con la nueva selección
      });
    },
    items: _programs.map<DropdownMenuItem<String>>((String program) {
      return DropdownMenuItem<String>(
        value: program,
        child: Text(program, style: TextStyle(color: AppColors.primary)),
      );
    }).toList(),
    isExpanded: true,
    decoration: InputDecoration(
      labelText: 'Seleccione una carrera', // Se usa labelText en lugar de hint
      labelStyle: TextStyle(color: AppColors.primary),
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
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: const Text('Registrar', style: TextStyle(color: AppColors.secondary, fontSize: 16)),
    );
  }
}
