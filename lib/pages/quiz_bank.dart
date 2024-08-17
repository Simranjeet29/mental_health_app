// quiz_bank.dart

class QuizQuestion {
  final String question;
  final List<QuizResponse> responses;

  QuizQuestion({required this.question, required this.responses});
}

class QuizResponse {
  final String text;
  final int score;

  QuizResponse({required this.text, required this.score});
}

final Map<String, List<QuizQuestion>> quizBank = {
  'depression': [
    QuizQuestion(
      question:
          'Are you having thoughts that you would be better off dead, or of hurting yourself?',
      responses: [
        QuizResponse(text: 'Yes', score: 1),
        QuizResponse(text: 'No', score: 0),
      ],
    ),
    // Add other questions
  ],
  'anxiety': [
    QuizQuestion(
      question: 'Are you feeling nervous, anxious, or on edge?',
      responses: [
        QuizResponse(text: 'Yes', score: 1),
        QuizResponse(text: 'No', score: 0),
      ],
    ),
    // Add other questions
  ],
  'ptsd': [
    QuizQuestion(
      question: 'Are you having nightmares about a distressing event(s)?',
      responses: [
        QuizResponse(text: 'Yes', score: 1),
        QuizResponse(text: 'No', score: 0),
      ],
    ),
    // Add other questions
  ],
  'schizophrenia': [
    QuizQuestion(
      question: 'Are you experiencing any brain fog?',
      responses: [
        QuizResponse(text: 'Yes', score: 1),
        QuizResponse(text: 'No', score: 0),
      ],
    ),
    // Add other questions
  ],
  'addiction': [
    QuizQuestion(
      question:
          'Are you using substances to numb any physical or emotional pain?',
      responses: [
        QuizResponse(text: 'Yes', score: 1),
        QuizResponse(text: 'No', score: 0),
      ],
    ),
    // Add other questions
  ],
};
