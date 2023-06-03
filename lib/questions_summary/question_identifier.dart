import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionIdentifier extends StatelessWidget {
  final int questionIndex;
  final bool isCorrectAnswer;

  const QuestionIdentifier(
      {super.key, required this.questionIndex, required this.isCorrectAnswer});

  @override
  Widget build(BuildContext context) {
    final questionNumber = questionIndex + 1;

    return Container(
      width: 30,
      height: 30,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isCorrectAnswer ? Colors.blue.shade200 : Colors.red.shade200,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Text(
        questionNumber.toString(),
        style: GoogleFonts.poppins(
          fontWeight: FontWeight.bold,
          color: Colors.purple.shade900,
        ),
      ),
    );
  }
}
