import 'package:charity_circle/core/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextFormFieldCustom extends StatefulWidget {
  final TextEditingController controller;
  final Icon icon;
  final String hintText;
  final bool isEmail;
  final bool isPassword;

  final VoidCallback? onPressed;

  const TextFormFieldCustom({
    super.key,
    required this.controller,
    required this.icon,
    required this.hintText,
    this.isEmail = false,
    this.isPassword = false,
    this.onPressed,
  });

  @override
  State<TextFormFieldCustom> createState() => _TextFormFieldCustomState();
}

class _TextFormFieldCustomState extends State<TextFormFieldCustom> {
  bool isPasswordNotVisible = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: widget.isPassword ? isPasswordNotVisible : false,
      decoration: InputDecoration(
        labelText: widget.hintText,
        prefixIcon: widget.icon,
        prefixIconColor: AppColors.chocolate,
        suffixIcon: widget.isPassword
            ? IconButton(
                onPressed: () {
                  setState(() {
                    isPasswordNotVisible = !isPasswordNotVisible;
                  });
                },
                icon: isPasswordNotVisible
                    ? Icon(CupertinoIcons.eye)
                    : Icon(CupertinoIcons.eye_slash),
              )
            : null,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Enter ${widget.hintText}";
        }
        if (widget.isEmail && !_isValidEmail(value)) {
          return "Enter a valid email";
        }
        if (widget.isPassword && value.length < 6) {
          return "Password must be at least 6 characters";
        }
        return null;
      },
    );
  }

  bool _isValidEmail(String email) {
    final RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }
}
