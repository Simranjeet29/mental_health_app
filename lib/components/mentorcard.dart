import 'package:flutter/material.dart';

class MentorCard extends StatelessWidget {
  final String mentorImagePath;
  final String ratings;
  final String mentorName;
  final String mentorProfession;
  const MentorCard(
      {required this.mentorImagePath,
      required this.mentorName,
      required this.mentorProfession,
      required this.ratings});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 25.0,
        bottom: 70,
      ),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.deepPurpleAccent),
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            // picture of the mentor

            ClipRRect(
              borderRadius: BorderRadius.circular(120),
              child: Image.asset(
                mentorImagePath,
                height: 80,
              ),
            ),

            SizedBox(
              height: 5,
            ),
            // rating out of 5
            Row(
              children: [
                Icon(
                  Icons.star,
                  color: Colors.yellow[600],
                ),
                Text(
                  ratings,
                  style: TextStyle(color: Colors.grey[700]),
                ),
              ],
            ),

            SizedBox(
              height: 5,
            ),

            // mentor name
            Text(
              mentorName,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),

            // mentor title
            Text(
              mentorProfession + ' 9 yrs.',
              style: TextStyle(color: Colors.grey[700]),
            )
          ],
        ),
      ),
    );
  }
}
