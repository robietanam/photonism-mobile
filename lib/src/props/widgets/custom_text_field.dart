import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.controller,
    this.icon,
    this.labelText,
    this.hintText,
  }) : super(key: key);

  final TextEditingController controller;
  final Icon? icon;
  final String? labelText;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        isDense: true,
        prefixIcon: icon,
        labelText: labelText,
        labelStyle: const TextStyle(fontSize: 12),
        hintText: hintText,
        hintStyle: const TextStyle(fontSize: 12),
        contentPadding: const EdgeInsets.all(0),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
      ),
    );
  }
}
