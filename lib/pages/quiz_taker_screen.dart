// quiz_taker_screen.dart

import 'package:flutter/material.dart';
import 'quiz_bank.dart';
import 'quiz_results_screen.dart';

class QuizTakerScreen extends StatefulWidget {
  final List<String> quizzesToTake;

  QuizTakerScreen({required this.quizzesToTake});

  @override
  _QuizTakerScreenState createState() => _QuizTakerScreenState();
}

class _QuizTakerScreenState extends State<QuizTakerScreen> {
  int currentQuizIndex = 0;
  Map<String, List<int>> quizScores = {};

  @override
  Widget build(BuildContext context) {
    String currentQuiz = widget.quizzesToTake[currentQuizIndex];
    List<QuizQuestion> questions = quizBank[currentQuiz]!;

    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz: $currentQuiz'),
      ),
      body: ListView.builder(
        itemCount: questions.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(questions[index].question),
            subtitle: Column(
              children: questions[index].responses.map((response) {
                return ListTile(
                  title: Text(response.text),
                  leading: Radio<int>(
                    value: response.score,
                    groupValue: quizScores[currentQuiz]?[index],
                    onChanged: (int? value) {
                      setState(() {
                        if (quizScores[currentQuiz] == null) {
                          quizScores[currentQuiz] =
                              List.filled(questions.length, 0);
                        }
                        quizScores[currentQuiz]![index] = value!;
                      });
                    },
                  ),
                );
              }).toList(),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.navigate_next),
        onPressed: () {
          if (currentQuizIndex < widget.quizzesToTake.length - 1) {
            setState(() {
              currentQuizIndex++;
            });
          } else {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => QuizResultsScreen(
                  quizScores: quizScores,
                  scores: {},
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
