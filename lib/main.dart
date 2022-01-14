import 'package:flutter/material.dart';
import 'package:my_fin/screens/dashboard.dart';
import 'package:my_fin/screens/initial_screens/account_confirmation.dart';
import 'package:my_fin/screens/initial_screens/create_aount_details.dart';
import 'package:my_fin/screens/initial_screens/create_account.dart';
import 'package:my_fin/screens/initial_screens/login.dart';
import 'package:my_fin/screens/initial_screens/splash_screen.dart';
import 'package:my_fin/screens/initial_screens/welcome_page_one.dart';
import 'package:my_fin/screens/transactions/filter_transactions.dart';
import 'package:my_fin/screens/transactions/transactions.dart';

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
          highlightColor: Colors.blue.shade50,
          checkboxTheme: CheckboxThemeData(
            side: BorderSide(width: 1, color: const Color(0xFF979797).withOpacity(0.6)),
            fillColor:  MaterialStateProperty.all(const Color(0xFF4D84FF)),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(3.0),
            ),
          ),
        ),
      initialRoute: SplashScreen.id,
      routes: {
        SplashScreen.id: (context) => const SplashScreen(),
        Dashboard.id: (context) => const Dashboard(),
        Transaction.id: (context) => const Transaction(),
        WelcomeScreen.id: (context) => const WelcomeScreen(),
        Register.id: (context) => const Register(),
        Details.id: (context) => const Details(),
        Login.id: (context) => const Login(),
        AccountConfirmation.id: (context) => const AccountConfirmation(),
        FilterTransactions.id: (context) => const FilterTransactions(),
      }
    );
  }
}
