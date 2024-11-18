import 'package:flutter/material.dart';

import '../../../../core/utils/no_space_input_formatter.dart';
import '../../widgets/custom_text_field.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({super.key, required this.hintText, required this.textInputAction, this.controller});
  final String hintText;
  final TextInputAction textInputAction;
  final TextEditingController? controller;

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _obsecureText = true;
  

  void _togglePassword() {
    setState(() {
      _obsecureText = !_obsecureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      controller: widget.controller,
      hintText: widget.hintText,
      obscureText: _obsecureText,
      maxLength: 32,
      textInputType: TextInputType.name,
      textInputFormatter: [NoSpaceInputFormatter()],
      textInputAction: widget.textInputAction,
      suffixIcon: IconButton(
        icon: Icon(_obsecureText ? Icons.visibility : Icons.visibility_off),
        onPressed: _togglePassword,
      ),      
    );
  }
}
