import 'package:amplify_test2/models/user.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  final BuildContext? context;
  final dynamic state;
  final Function(String) onTextChanged;
  final IconData? icon;
  final String? hintText;
  final String? routeName;
  final VoidCallback? onNextScreen;

  const SignupScreen({
    Key? key,
    this.context,
    this.state,
    required this.onTextChanged,
    this.icon,
    this.hintText,
    this.routeName,
    this.onNextScreen,
  }) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool get isPassword =>
      widget.hintText?.trim().toLowerCase() == 'password' ||
      widget.hintText?.trim().toLowerCase() == 'confirm password';

  IconData visiblityIcon = Icons.visibility;
  bool? isShowText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(34.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextField(
                  cursorColor: Colors.white,
                  style: const TextStyle(color: Colors.white),
                  obscureText: isShowText ?? isPassword,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.deepOrange,
                    hintStyle: const TextStyle(
                      color: Colors.white60,
                    ),
                    focusColor: Colors.white,
                    border:
                        const OutlineInputBorder(borderSide: BorderSide.none),
                    focusedBorder:
                        const OutlineInputBorder(borderSide: BorderSide.none),
                    prefixIcon: Icon(
                      widget.icon ?? Icons.hourglass_empty,
                      color: Colors.white,
                    ),
                    hintText: widget.hintText ?? 'hintText',
                    suffixIcon: isPassword
                        ? IconButton(
                            icon: Icon(visiblityIcon),
                            onPressed: () => {
                                  if (visiblityIcon == Icons.visibility)
                                    {
                                      setState(() {
                                        visiblityIcon = Icons.visibility_off;
                                        isShowText = false;
                                      })
                                    }
                                  else
                                    {
                                      setState(() {
                                        visiblityIcon = Icons.visibility;
                                        isShowText = true;
                                      })
                                    }
                                })
                        : null,
                  ),
                  onChanged: (value) => widget.onTextChanged(value),
                ),
                Padding(
                  padding: const EdgeInsets.all(30),
                  child: TextButton(
                    onPressed: widget.routeName == '/confirmCode' ||
                            widget.routeName == '/dashboard'
                        ? widget.onNextScreen
                        : () => Navigator.pushReplacementNamed(
                              context,
                              widget.routeName ?? '',
                            ),
                    child: const Text(
                      'Next',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.deepOrange,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
