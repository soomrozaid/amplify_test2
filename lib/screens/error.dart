import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  final String? err;
  const ErrorScreen({Key? key, this.err}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(err ?? 'unknown error occured, while routing'),
      ),
    );
  }
}
