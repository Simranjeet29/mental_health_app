import 'package:chattingdotcom/auth/auth.dart';
import 'package:chattingdotcom/colors/colors.dart';
import 'package:chattingdotcom/components/onboarding_page.dart';

import 'package:flutter/material.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  int selectPage = 0;
  PageController controller = PageController();

  @override
  void initState() {
    super.initState();

    controller.addListener(() {
      selectPage = controller.page?.round() ?? 0;

      setState(() {});
    });
  }

  List pageArr = [
    {
      "title": "Track Your Goals",
      "subtitle":
          "Don't worry about your mental health, we can help you improve your mental health.",
      "image": "assets/img/m1.png"
    },
    {
      "title": "Get Your Reports",
      "subtitle":
          "We will analyze and show your mental health stats which will help you get better.",
      "image": "assets/img/m2.png"
    },
    {
      "title": "AI Mentor Assistance",
      "subtitle": "Chat with our AI assistant and help us know you more.",
      "image": "assets/img/m3.png"
    },
    {
      "title": "Get Daily Quotes",
      "subtitle": "Daily motivational quotes to keep you busy and stress free.",
      "image": "assets/img/m4.png"
    },
    // {"title": "", "subtitle": "", "image": ""},
  ];

  @override
  Widget build(BuildContext context) {
    // var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: TColor.white,
      body: Stack(
        alignment: Alignment.bottomRight,
        children: [
          PageView.builder(
              controller: controller,
              itemCount: pageArr.length,
              itemBuilder: (context, index) {
                var pObj = pageArr[index] as Map? ?? {};
                return OnBoardingPage(
                  pObj: pObj,
                );
              }),
          SizedBox(
            width: 120,
            height: 120,
            child: Stack(
              alignment: Alignment.center,
              children: [
                // circular progress bar code
                SizedBox(
                  width: 70,
                  height: 70,
                  child: CircularProgressIndicator(
                    color: TColor.primaryColor1,
                    value: (selectPage + 1) / 4,
                    strokeWidth: 2,
                  ),
                ),

                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                      color: TColor.primaryColor1,
                      borderRadius: BorderRadius.circular(35)),
                  child: IconButton(
                    icon: Icon(
                      Icons.navigate_next,
                      color: TColor.white,
                    ),
                    onPressed: () {
                      if (selectPage < 3) {
                        selectPage = selectPage + 1;
                        controller.animateToPage(selectPage,
                            duration: const Duration(milliseconds: 600),
                            curve: Curves.bounceOut);
                        // controller.jumpToPage(selectPage);

                        // setState(() {});
                      } else {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const AuthPage()));
                        // open welcome screen
                        // print("Open Welcome Screen");
                      }
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
