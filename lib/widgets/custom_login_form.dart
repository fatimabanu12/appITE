import 'package:flutter/material.dart';

class CustomLoginForm extends StatelessWidget {
  final String text;
  const CustomLoginForm({required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
        ),
        SizedBox(
          width: 370,
          child: TextField(
            decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(8))),
          ),
        ),
      ],
    );
  }
}
