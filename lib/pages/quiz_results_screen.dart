import 'package:chattingdotcom/pages/chatbot.dart';
import 'package:flutter/material.dart';

class QuizResultsScreen extends StatelessWidget {
  final Map<String, int> scores;

  QuizResultsScreen(
      {required this.scores, required Map<String, List<int>> quizScores});

  String getResultText(String quizName, int score) {
    switch (quizName) {
      case 'depression':
        if (score >= 15) {
          return 'You have Severe Depression';
        } else if (score >= 10) {
          return 'You have Moderate Depression';
        } else if (score >= 5) {
          return 'You have Mild Depression';
        } else {
          return 'You have Minimal or No Depression';
        }
      case 'anxiety':
        if (score >= 15) {
          return 'You have Severe Anxiety';
        } else if (score >= 10) {
          return 'You have Moderate Anxiety';
        } else if (score >= 5) {
          return 'You have Mild Anxiety';
        } else {
          return 'You have Minimal or No Anxiety';
        }
      case 'ptsd':
        if (score >= 15) {
          return 'You have Severe PTSD';
        } else if (score >= 10) {
          return 'You have Moderate PTSD';
        } else if (score >= 5) {
          return 'You have Mild PTSD';
        } else {
          return 'You have Minimal or No PTSD';
        }
      case 'schizophrenia':
        if (score >= 15) {
          return 'You have Severe Schizophrenia';
        } else if (score >= 10) {
          return 'You have Moderate Schizophrenia';
        } else if (score >= 5) {
          return 'You have Mild Schizophrenia';
        } else {
          return 'You have Minimal or No Schizophrenia';
        }
      case 'addiction':
        if (score >= 15) {
          return 'You have Severe Addiction';
        } else if (score >= 10) {
          return 'You have Moderate Addiction';
        } else if (score >= 5) {
          return 'You have Mild Addiction';
        } else {
          return 'You have Minimal or No Addiction';
        }
      default:
        return 'Invalid Quiz Name';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Results')),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Here are your Results:',
                style: TextStyle(fontSize: 32, color: Colors.white)),
            ...scores.entries.map((entry) {
              return Column(
                children: [
                  Text(getResultText(entry.key, entry.value),
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  SizedBox(height: 20),
                ],
              );
            }).toList(),
            CustomButton(
              text: 'Take Another Quiz',
              route: '/quizselect',
            ),
            CustomButton(
              text: 'Dashboard',
              route: '/dashboard',
            ),
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String text;
  final String route;

  CustomButton({required this.text, required this.route});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ChatBotScreen(),
            ));
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Color.fromARGB(255, 123, 178, 255),
        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
      ),
      child: Text(text, style: TextStyle(fontSize: 20)),
    );
  }
}
