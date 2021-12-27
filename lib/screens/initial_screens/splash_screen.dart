import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_fin/screens/initial_screens/welcome_page_one.dart';
import 'package:my_fin/utils/constants.dart';

class SplashScreen extends StatefulWidget {

  static const String id = 'splashScreen';
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  /// Function to navigate to the next screen after a timer
  void _navigate() {
    Timer(const Duration(seconds: 3), ()=> Navigator.pushReplacementNamed(context, WelcomePageOne.id));
  }

  @override
  void initState() {
    _navigate();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
       bottom: false,
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        body: LayoutBuilder(
          builder: (context, constraints) {
            return Center(
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/splashimg.png"),
                    fit: BoxFit.contain,
                  ),
                ),
                child: Center(
                  child: Container(
                    width: constraints.maxWidth * 0.19,
                    height: constraints.maxHeight * 0.19,
                    margin: const EdgeInsets.only(right: 20),
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/splashimg2.png"),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  ),
                ),
              );
          }
        ),
      ),
    );
  }
}
