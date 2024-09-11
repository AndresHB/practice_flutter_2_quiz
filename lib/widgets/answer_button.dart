import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  final String label;
  final void Function() onPress;

  const AnswerButton(this.label, this.onPress, {super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: const Color.fromARGB(255, 33, 1, 95),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(40))),
      child: Text(
        label,
        textAlign: TextAlign.center,
      ),
    );
  }
}
