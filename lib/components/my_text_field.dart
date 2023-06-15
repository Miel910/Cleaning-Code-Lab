import 'package:flutter/material.dart';

class MyTextField extends StatefulWidget {
  const MyTextField({
    super.key,
    required this.label,
    this.isPassword = false,
    this.controller,
    this.onChanged,
    this.minLines = 1,
    this.maxLines = 1,
  });

  final TextEditingController? controller;
  final String label;
  final bool isPassword;
  final Function(String)? onChanged;
  final int minLines;
  final int maxLines;

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

bool isUbscure = true;

class _MyTextFieldState extends State<MyTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: TextField(
        controller: widget.controller,
        obscureText: widget.isPassword ? isUbscure : false,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: widget.label,
          labelStyle: const TextStyle(fontWeight: FontWeight.w600),
          suffixIcon: widget.isPassword
              ? IconButton(
                  onPressed: () {
                    setState(
                      () {
                        isUbscure = !isUbscure;
                      },
                    );
                  },
                  icon: isUbscure
                      ? const Icon(
                          Icons.visibility,
                          size: 20,
                          color: Colors.grey,
                        )
                      : const Icon(
                          Icons.visibility_off,
                          size: 20,
                          color: Colors.grey,
                        ),
                )
              : IconButton(
                  onPressed: () {
                    widget.controller?.clear();
                  },
                  icon: const Icon(
                    Icons.close,
                    size: 20,
                    color: Colors.grey,
                  ),
                ),
        ),
      ),
    );
  }
}
