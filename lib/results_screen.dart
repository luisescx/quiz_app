import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_summary/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  final List<String> chosenAnswers;
  final void Function() restartQuiz;

  const ResultsScreen({
    super.key,
    required this.chosenAnswers,
    required this.restartQuiz,
  });

  List<Map<String, Object>> get summaryData {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add(
        {
          "question_index": i,
          "question": questions[i].text,
          "correct_answer": questions[i].answers[0],
          "user_answer": chosenAnswers[i]
        },
      );
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final totalQuestions = questions.length;
    final totalCorrectAnswers = summaryData
        .where((data) =>
            (data['correct_answer'] as String) ==
            (data['user_answer'] as String))
        .length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $totalCorrectAnswers out of $totalQuestions questions correctly',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                color: Colors.pink.shade200,
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionsSummary(
              summaryData: summaryData,
            ),
            const SizedBox(
              height: 30,
            ),
            TextButton.icon(
              onPressed: restartQuiz,
              label: const Text('Restart Quiz'),
              icon: const Icon(Icons.refresh),
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
