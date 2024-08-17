import 'package:chattingdotcom/colors/colors.dart';
import 'package:chattingdotcom/pages/onboarding_screens.dart';
import 'package:flutter/material.dart';

class StartedVeiw extends StatefulWidget {
  const StartedVeiw({Key? key}) : super(key: key);

  @override
  State<StartedVeiw> createState() => _StartedVeiwState();
}

class _StartedVeiwState extends State<StartedVeiw> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.purple.shade200,
      body: Container(
        width: media.width,
        // decoration: BoxDecoration(),

        // Center text
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),

                // Logo

                Container(
                  width: 80,
                  height: 80,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: TColor.white,
                    border: Border.all(
                      color: Colors.purple,
                    ),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Image.asset(
                    "assets/img/mental.png",
                    width: 50,
                    height: 50,
                  ),
                ),

                // Space

                const SizedBox(
                  height: 12,
                ),

                // Text
                const Text(
                  "HAMDARD",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 36,
                      fontWeight: FontWeight.w700),
                ),
                const Text(
                  "An app for students",
                  style: TextStyle(
                    letterSpacing: 4,
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
                const Spacer(),

                // Button

                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(20),

                    // Material button to navigate to onboarding screens
                    child: MaterialButton(
                      // button navigation
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const OnBoarding()),
                        );
                      },
                      height: 50,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)),
                      textColor: TColor.primaryColor1,
                      minWidth: double.maxFinite,
                      color: TColor.white,
                      child: const Text(
                        "Get Started",
                        style: TextStyle(
                          color: Colors.deepPurple,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
