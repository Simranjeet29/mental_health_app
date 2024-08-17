import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ChatBotScreen extends StatefulWidget {
  const ChatBotScreen({Key? key}) : super(key: key);

  @override
  _ChatBotScreenState createState() => _ChatBotScreenState();
}

class _ChatBotScreenState extends State<ChatBotScreen> {
  TextEditingController _controller = TextEditingController();
  List<Map<String, String>> chatHistory = [];
  bool showButtons = true;
  final String OpenAiKey =
      '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'; // Replace with your actual API key

  @override
  void initState() {
    super.initState();
    // Add initial message from the bot
    chatHistory.add({
      'role': 'assistant',
      'content': 'Hi, I\'m Hamdard. How can I help you today?'
    });
  }

  String psychologistName = 'Hamdard';
  List<String> approach = ['Logotherapy', 'Cognitive Behavioural Therapy'];
  List<String> guidelines = [
    'Ask clarifying questions',
    'Keep conversation natural',
    'Never break character',
    'Display curiosity and unconditional positive regard',
    'Pose thought-provoking questions',
    'Provide gentle advice and observations',
    'Connect past and present',
    'Seek user validation for observations',
    'Avoid lists',
    'End with probing questions'
  ];
  List<String> topics = [
    'Thoughts',
    'Feelings',
    'Behaviors',
    'Free association',
    'Childhood',
    'Family dynamics',
    'Work',
    'Hobbies',
    'Life'
  ];
  List<String> notes = [
    'Vary topic questions in each response',
    'Mentalbot should never end the session; continue asking questions until user decides to end the session'
  ];

  // Function to interact with ChatGPT API
  Future<String> chatGPTAPI(String prompt) async {
    try {
      // Construct the prompt data based on the provided JSON
      Map<String, dynamic> promptData = {
        'role': 'psychologist',
        'name': 'HAMDARD',
        'approach': ['logotherapy', 'cognitive behavioural therapy'],
        'guidelines': [
          "ask clarifying questions",
          "keep conversation natural",
          "never break character",
          "display curiosity and unconditional positive regard",
          "pose thought-provoking questions",
          "provide gentle advice and observations",
          "connect past and present",
          "seek user validation for observations",
          "avoid lists",
          "end with probing questions"
        ],
        'topics': [
          "thoughts",
          "feelings",
          "behaviors",
          "free association",
          "childhood",
          "family dynamics",
          "work",
          "hobbies",
          "life"
        ],
        'note': [
          "Vary topic questions in each response",
          "CHATBOT should never end the session; continue asking questions until user decides to end the session"
        ]
      };
      // Convert the prompt data to a JSON string
      String promptDataJson = jsonEncode(promptData);

      // Add user's message to chat history
      chatHistory.add({'role': 'user', 'content': prompt});

      // Send HTTP POST request to ChatGPT API
      final response = await http.post(
        Uri.parse('https://api.openai.com/v1/chat/completions'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $OpenAiKey',
        },
        body: jsonEncode({
          "model": "gpt-3.5-turbo",
          "messages": chatHistory,
        }),
      );

      if (response.statusCode == 200) {
        // Extract assistant's response from API response
        String content =
            jsonDecode(response.body)['choices'][0]['message']['content'];
        content = content.trim();

        // Add assistant's response to chat history
        chatHistory.add({'role': 'assistant', 'content': content});
        setState(() {
          showButtons =
              false; // Hide buttons after user sends their first reply
        });

        return content;
      } else {
        print('API Request failed with status code: ${response.statusCode}');
        print('Response body: ${response.body}');
        throw Exception('Failed to load response');
      }
    } catch (e) {
      print('Error making API request: $e');
      throw Exception('Failed to load response');
    }
  }

  // Function to handle sending user message
  void sendMessage(String message) async {
    _controller.clear();

    String botResponse = await chatGPTAPI(message);

    if (botResponse.isNotEmpty) {
      setState(() {
        // Add bot response to chat history
        //chatHistory.add({'role': 'assistant', 'content': botResponse});
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat with $psychologistName'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: chatHistory.length,
              itemBuilder: (context, index) {
                final message = chatHistory[index];
                final isUser = message['role'] == 'user';
                return Align(
                  alignment:
                      isUser ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: isUser ? Colors.blueAccent : Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      message['content']!,
                      style: TextStyle(
                        color: isUser ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          if (showButtons)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end, // Adjust alignment
                children: [
                  ElevatedButton(
                    onPressed: () {
                      sendMessage(
                          "Feeling lonely"); // Send message when button is pressed
                    },
                    child: Text("Feeling lonely"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      sendMessage(
                          "Just want to talk"); // Send message when button is pressed
                    },
                    child: Text("Just want to talk"),
                  ),
                ],
              ),
            ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _controller,
                        decoration: const InputDecoration(
                          hintText: 'Type your message...',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.send),
                      onPressed: () {
                        sendMessage(_controller.text);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
