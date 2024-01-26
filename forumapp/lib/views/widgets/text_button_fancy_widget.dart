
import 'package:flutter/material.dart';

class TextButtonFancy extends StatelessWidget {
  const TextButtonFancy({
    Key? key, required this.text, required this.onPress, this.fontSize = 16,
  }) : super(key: key);

  final String text;
  final Function onPress;
  final int fontSize;

  @override
  Widget build(BuildContext context) {
    return const SizedBox(height: 20,);
  }
}