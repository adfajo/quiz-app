import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:quiz_app/questions_summary/question_identifier.dart';

/// A widget that displays a summary item.
class SummaryItem extends StatelessWidget {
  /// Creates a [SummaryItem].
  const SummaryItem(this.itemData, {super.key});
  /// The data of the item.
  final Map<String, Object> itemData;

  /// Builds the widget.
  @override
  Widget build(BuildContext context) {
    final isCorrectAnswer =
        itemData['user_answer'] == itemData['correct_answer'];

    // Return a row with the question identifier and the question text.
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
      ),
      // Display the question identifier and the question text.
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Display the question identifier.
          QuestionIdentifier(
            isCorrectAnswer: isCorrectAnswer,
            questionIndex: itemData['question_index'] as int,
          ),
          const SizedBox(width: 20),
          /// Display the question text.
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Display the question text.
                Text(
                  itemData['question'] as String,
                  style: GoogleFonts.lato(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                /// Display the user's answer and the correct answer.
                Text(itemData['user_answer'] as String,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 202, 171, 252),
                    )),
                /// Display the correct answer.
                Text(itemData['correct_answer'] as String,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 181, 254, 246),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}