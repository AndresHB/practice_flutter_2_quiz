import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleText extends StatelessWidget {
  final String label;

  const TitleText(this.label, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      textAlign: TextAlign.center,
      style: GoogleFonts.lato(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: const Color.fromARGB(255, 201, 153, 251),
      ),
    );
  }
}
