import 'package:flutter/material.dart';

class InitialMainText extends StatelessWidget {
  final String title;
  const InitialMainText({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Text(title, style: const TextStyle(fontSize: 20)),
    );
  }
}
