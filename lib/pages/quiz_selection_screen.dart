// quiz_selection_screen.dart

import 'package:flutter/material.dart';
import 'quiz_taker_screen.dart';

class QuizSelectionScreen extends StatefulWidget {
  @override
  _QuizSelectionScreenState createState() => _QuizSelectionScreenState();
}

class _QuizSelectionScreenState extends State<QuizSelectionScreen> {
  Map<String, bool> selectedQuizzes = {
    'depression': false,
    'anxiety': false,
    'ptsd': false,
    'schizophrenia': false,
    'addiction': false,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Quizzes'),
      ),
      body: ListView(
        children: selectedQuizzes.keys.map((quiz) {
          return CheckboxListTile(
            title: Text(quiz),
            value: selectedQuizzes[quiz],
            onChanged: (bool? value) {
              setState(() {
                selectedQuizzes[quiz] = value!;
              });
            },
          );
        }).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.navigate_next),
        onPressed: () {
          List<String> quizzesToTake = selectedQuizzes.keys
              .where((quiz) => selectedQuizzes[quiz]!)
              .toList();
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  QuizTakerScreen(quizzesToTake: quizzesToTake),
            ),
          );
        },
      ),
    );
  }
}
