import 'package:flutter/material.dart';

class ErrorMessage extends StatelessWidget {
  final String error;
  final VoidCallback onTap;

  const ErrorMessage({Key? key, required this.error, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: InkWell(
            onTap: onTap,
            child: Text('Error Occurred:\n $error\nTap To Try Again.')));
  }
}