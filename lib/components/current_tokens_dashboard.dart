import 'package:flutter/material.dart';

class CurrentTokensContainer extends StatelessWidget {

  final BoxConstraints constraints;
  final String tokenAmount;
  final String imageUrl;

  const CurrentTokensContainer({
    Key? key,
    required this.tokenAmount,
    required this.imageUrl,
    required this.constraints
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 25),
      decoration: BoxDecoration(
        color: const Color(0xFFF7F9FD),
        borderRadius: BorderRadius.circular(5.3),
        border: Border.all(
          color: const Color(0xFFF0F4FD),
          width: 1.3,
        ),
      ),
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: constraints.maxHeight * 0.016,
            child: Image.asset(imageUrl),
          ),
          const SizedBox(height: 8.0),
          /// coin name
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 15,
                height: 15,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/Frame.png'),
                  ),
                ),
              ),
              const SizedBox(width: 2.0),
              Text(
                tokenAmount,
                style: const TextStyle(
                  color: Color(0xFF001140),
                  fontWeight: FontWeight.w500,
                  fontSize: 17,
                  letterSpacing: 1.3,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}