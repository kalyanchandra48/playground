import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  TextEditingController controller;
  String labelText;
  Color color;
  bool obscure;
  String hintText;
  Function updateConditionFunction;
  TextFieldWidget({
    Key? key,
    required this.updateConditionFunction,
    required this.hintText,
    required this.color,
    required this.controller,
    required this.labelText,
    required this.obscure,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: TextField(
          onChanged: (value) {
            updateConditionFunction();
          },
          // maxLines: null,
          autofocus: true,
          showCursor: true,
          cursorHeight: 30,
          controller: controller,
          obscureText: obscure,
          cursorColor: Colors.black,
          scrollPadding: const EdgeInsets.symmetric(
            horizontal: 0,
          ),
          style: const TextStyle(color: Colors.black),
          decoration: InputDecoration(
            hintStyle: const TextStyle(
              color: Colors.black,
            ),
            hintText: hintText,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 24, vertical: 0),
            labelText: labelText,
            labelStyle: const TextStyle(
              color: Colors.black,
            ),
            border: const OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: color,
          ),
        ),
      ),
    );
  }
}
