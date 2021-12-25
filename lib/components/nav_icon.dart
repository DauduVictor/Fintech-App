import 'package:flutter/material.dart';

class ReusableBottomIcon extends StatelessWidget {

  final String name;
  final IconData iconName;
  final Color iconColor;
  final Color textColor;

  const ReusableBottomIcon({
    Key? key,
    required this.name,
    required this.iconName,
    required this.iconColor,
    required this.textColor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(
            iconName,
            size: 29,
            color: iconColor,
          ),
          Text(
            name,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }
}