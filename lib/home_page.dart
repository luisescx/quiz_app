import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyHomePage extends StatelessWidget {
  final void Function() switchScreen;

  const MyHomePage({super.key, required this.switchScreen});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
            color: const Color.fromARGB(150, 247, 247, 247),
          ),
          const SizedBox(
            height: 48,
          ),
          Text(
            'Learn Flutter the fun away',
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          OutlinedButton.icon(
            onPressed: switchScreen,
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            icon: const Icon(Icons.arrow_right_alt),
            label: Text(
              'Start quiz',
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
