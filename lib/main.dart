import 'package:flutter/material.dart';
import 'package:my_fin/screens/dashboard.dart';
import 'package:my_fin/screens/initial_screens/details.dart';
import 'package:my_fin/screens/initial_screens/register.dart';
import 'package:my_fin/screens/initial_screens/splash_screen.dart';
import 'package:my_fin/screens/initial_screens/welcome_page_one.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Fintech App',
      debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: "CircularStd",
        ),
      initialRoute: SplashScreen.id,
      routes: {
        SplashScreen.id: (context) => const SplashScreen(),
        Dashboard.id: (context) => const Dashboard(),
        WelcomeScreen.id: (context) => const WelcomeScreen(),
        Register.id: (context) => const Register(),
        Details.id: (context) => const Details(),
      }
    );
  }
}
