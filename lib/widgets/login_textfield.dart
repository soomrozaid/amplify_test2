import 'package:flutter/material.dart';

class LoginTextField extends StatefulWidget {
  final Function(String)? onChanged;
  final IconData? icon;
  final String? labelText;

  const LoginTextField({
    Key? key,
    this.onChanged,
    this.icon,
    this.labelText,
  }) : super(key: key);

  @override
  State<LoginTextField> createState() => _LoginTextFieldState();
}

class _LoginTextFieldState extends State<LoginTextField> {
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.deepOrange),
        ),
        icon: Icon(widget.icon),
        suffixIcon: widget.labelText?.trim().toLowerCase() == 'password'
            ? IconButton(
                icon: Icon(isVisible ? Icons.visibility_off : Icons.visibility),
                onPressed: () => setState(() => isVisible = !isVisible))
            : null,
        labelText: widget.labelText,
      ),
      onChanged: widget.onChanged,
      obscureText: isVisible,
    );
  }
}
