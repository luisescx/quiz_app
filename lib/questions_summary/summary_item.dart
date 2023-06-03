import 'package:flutter/material.dart';
import 'package:quiz_app/questions_summary/question_identifier.dart';
import 'package:google_fonts/google_fonts.dart';

class SummaryItem extends StatelessWidget {
  final Map<String, Object> itemData;

  const SummaryItem({super.key, required this.itemData});

  @override
  Widget build(BuildContext context) {
    final isCorrectAnswer =
        itemData['user_answer'] == itemData['correct_answer'];

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        QuestionIdentifier(
          questionIndex: (itemData['question_index'] as int),
          isCorrectAnswer: isCorrectAnswer,
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              itemData['question'] as String,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              itemData['user_answer'] as String,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w400,
                color: Colors.red.shade200,
                // fontSize: 16,
              ),
            ),
            Text(
              itemData['correct_answer'] as String,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w400,
                color: Colors.blue.shade200,
                // fontSize: 16,
              ),
            ),
          ],
        ))
      ],
    );
  }
}
