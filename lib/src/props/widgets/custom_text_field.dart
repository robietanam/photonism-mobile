import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    Key? key,
    required this.controller,
    this.icon,
    this.labelText,
    this.hintText,
    this.isPassword = false,
  }) : super(key: key);

  final TextEditingController controller;
  final Icon? icon;
  final String? labelText;
  final String? hintText;
  final bool isPassword;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    print(widget.isPassword);

    return TextField(
      controller: widget.controller,
      obscureText: (widget.isPassword && !isVisible) ? true : false,
      decoration: InputDecoration(
        isDense: true,
        suffixIcon: (widget.isPassword)
            ? IconButton(
                onPressed: () {
                  print('got clock');
                  setState(() {
                    isVisible = !isVisible;
                  });
                },
                color: Theme.of(context).primaryColor,
                icon: (isVisible)
                    ? Icon(
                        Icons.visibility,
                        color: Theme.of(context).primaryColor,
                      )
                    : Icon(Icons.visibility_off,
                        color: Theme.of(context).primaryColor))
            : null,
        prefixIcon: widget.icon,
        labelText: widget.labelText,
        labelStyle: const TextStyle(fontSize: 12),
        hintText: widget.hintText,
        hintStyle: const TextStyle(fontSize: 12),
        contentPadding: const EdgeInsets.all(0),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
      ),
    );
  }
}
