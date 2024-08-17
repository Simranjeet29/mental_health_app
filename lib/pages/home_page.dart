import 'package:chattingdotcom/components/categorycard.dart';
import 'package:chattingdotcom/components/drawer.dart';
import 'package:chattingdotcom/components/mentorcard.dart';
import 'package:chattingdotcom/pages/chatbot.dart';
import 'package:chattingdotcom/pages/profile_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // user
  final currenUser = FirebaseAuth.instance.currentUser!;

  // Text controller
  final textController = TextEditingController();

  // sign user out

  void signOut() {
    FirebaseAuth.instance.signOut();
  }

  // navigate to profile page

  void goToProfilePage() {
    // pop menu driver

    Navigator.pop(context);

    // go to profile page

    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const ProfilePage(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.purple.shade200,
        title: Padding(
          padding: const EdgeInsets.only(left: 80),
          child: Text(
            "H A M D A R D",
            style: TextStyle(color: Colors.black),
          ),
        ),
        actions: [
          // chat button

          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ChatBotScreen()),
                );
              },
              icon: Icon(Icons.chat),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            // app bar
            const Padding(
              padding: EdgeInsets.only(top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Name

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Let's analyze your mood ✌️",
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),

                  // Profile
                  // CircleAvatar(
                  //   radius: 25,
                  //   backgroundImage: AssetImage("assets/img/doctor1.png"),
                  // ),
                ],
              ),
            ),

            const SizedBox(
              height: 25,
            ),

            // card--> how do you feel

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: Colors.blue[200],
                    borderRadius: BorderRadius.circular(12)),
                child: Row(
                  children: [
                    // animation or cute picture.
                    Container(),

                    const SizedBox(
                      width: 20.0,
                    ),

                    // how do you feel

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "How do you feel?",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),

                          // Gap

                          const SizedBox(
                            height: 8,
                          ),

                          // Gap

                          const Text(
                            "Talk to AI Assistance now!!",
                            style: TextStyle(fontSize: 14),
                          ),

                          // Gap

                          const SizedBox(
                            height: 10,
                          ),

                          //  Chat now button

                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ChatBotScreen()),
                              );
                            },
                            child: Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Center(
                                child: Text(
                                  'Chat Now',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Text

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: const Text('How is your mood today?'),
                ),
              ],
            ),

            // horizontal view-- moods

            Container(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  CategoryCard(
                    categoryName: "Happy",
                    iconImagePath: "assets/img/happy.png",
                  ),
                  CategoryCard(
                    categoryName: "Tired",
                    iconImagePath: "assets/img/depressed.png",
                  ),
                  CategoryCard(
                    categoryName: "Anrgy",
                    iconImagePath: "assets/img/angry.png",
                  ),
                  CategoryCard(
                    categoryName: "Calm",
                    iconImagePath: "assets/img/calm.png",
                  ),
                  CategoryCard(
                    categoryName: "Anxious",
                    iconImagePath: "assets/img/anxious.png",
                  ),
                  CategoryCard(
                    categoryName: "Sad",
                    iconImagePath: "assets/img/sad.png",
                  ),
                  CategoryCard(
                    categoryName: "Inspired",
                    iconImagePath: "assets/img/inspired.png",
                  ),
                ],
              ),
            ),

            // mentor list

            SizedBox(height: 25),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Talk to our mentors"),
                  // Text(
                  //   "See all",
                  //   style: TextStyle(
                  //     color: Colors.grey[500],
                  //     fontSize: 16,
                  //     fontWeight: FontWeight.bold,
                  //   ),
                  // ),
                ],
              ),
            ),

            // Gap

            const SizedBox(
              height: 20,
            ),

            // Gap

            Expanded(
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  MentorCard(
                    mentorImagePath: 'assets/img/c1.png',
                    ratings: '4.5',
                    mentorName: 'Dr. Mahesh sharma',
                    mentorProfession: 'Therapist',
                  ),
                  MentorCard(
                    mentorImagePath: 'assets/img/c3.png',
                    ratings: '4.9',
                    mentorName: 'Dr. Riya Mehta',
                    mentorProfession: 'Welfare mentor',
                  ),
                  MentorCard(
                    mentorImagePath: 'assets/img/c2.png',
                    ratings: '4.5',
                    mentorName: 'Dr. Rohan Rao',
                    mentorProfession: 'Therapist',
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      drawer: MyDrawer(
        onProfileTap: goToProfilePage,
        onSignOut: signOut,
      ),
    );
  }
}
