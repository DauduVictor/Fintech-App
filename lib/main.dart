import 'package:flutter/material.dart';
import 'package:my_fin/screens/dashboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Fintech App Demo',
      debugShowCheckedModeBanner: false,
      initialRoute: Dashboard.id,
      routes: {
        Dashboard.id: (context) => const Dashboard(),
      }
    );
  }
}
