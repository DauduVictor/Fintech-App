import 'package:flutter/material.dart';

class SkipButton extends StatelessWidget {

  final PageController pageController;

  const SkipButton({
    Key? key,
    required this.pageController,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Align(
      alignment:  Alignment.topRight,
      child: ElevatedButton(
        onPressed: () {
          pageController.jumpToPage(4);
        },
        style: ElevatedButton.styleFrom(
          primary: const Color(0xFF092E95),
          onSurface: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(26),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        ),
        child: const Text(
          'Skip',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}