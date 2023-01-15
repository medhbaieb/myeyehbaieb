import 'package:flutter/material.dart';

class MyTextField extends StatefulWidget {
  @override
  _MyTextFieldState createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  late FocusNode _focusNode;

  @override
  void initState() {
    _focusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FocusScope(
      
      child: TextField(
        focusNode: _focusNode,
        decoration: InputDecoration(labelText: 'Enter your name'),
      ),
      
      onFocusChange: (hasFocus) {
        if (hasFocus) {
          FocusScope.of(context).requestFocus(_focusNode);
        }
      },
    );
  }
}
