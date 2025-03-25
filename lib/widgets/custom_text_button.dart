import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final String route;
  final Alignment aligment;
  const CustomTextButton(
      {required this.text,
      required this.route,
      this.aligment = Alignment.center,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: aligment,
      child: Container(
        margin: EdgeInsets.only(right: 30),
        child: TextButton(
            onPressed: () {
              Navigator.pushNamed(context, route);
            },
            child: Text(text, style: TextStyle(color: Color(0xffd8c495)))),
      ),
    );
  }
}
