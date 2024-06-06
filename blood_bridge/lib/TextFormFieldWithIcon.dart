import 'package:flutter/material.dart';

class TextFormFieldWithIcon extends StatelessWidget {
  final IconData icon;
  final String labelText;
  final bool obscureText;
  final Function(String?)? onSaved;
  final String? Function(String?)? validator;

  const TextFormFieldWithIcon({
    super.key,
    required this.icon,
    required this.labelText,
    this.obscureText = false,
    this.onSaved,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: labelText,
        icon: Icon(
          icon,
          color: const Color.fromARGB(255, 60, 152, 192),
        ), // Set the icon color to blue
      ),
      obscureText: obscureText,
      onSaved: onSaved,
      validator: validator,
    );
  }
}
