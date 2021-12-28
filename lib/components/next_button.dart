import 'package:flutter/material.dart';

class NextButton extends StatelessWidget {

  final PageController pageController;

  const NextButton({
    Key? key,
    required this.pageController
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        pageController.nextPage(
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      },
      style: ElevatedButton.styleFrom(
        primary: const Color(0xFF27AE60),
        onSurface: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(26),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 13),
      ),
      child: const Text(
        'Next',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}