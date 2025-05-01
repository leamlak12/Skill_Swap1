import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final IconData icon;
  final String hintText;
  final bool isPassword;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  const CustomTextField({
    super.key,
    required this.icon,
    required this.hintText,
    this.isPassword = false,
    this.controller,
    this.validator,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextFormField(
        controller: widget.controller,
        validator: widget.validator,
        obscureText: widget.isPassword && _obscureText,
        decoration: InputDecoration(
          prefixIcon: Icon(widget.icon, color: Colors.grey),
          hintText: widget.hintText,
          border: InputBorder.none,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          suffixIcon: widget.isPassword
              ? IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                )
              : null,
        ),
      ),
    );
  }
}
