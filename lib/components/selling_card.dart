import 'package:flutter/material.dart';

class ReusableSellingCard extends StatelessWidget {

  final bool isFall;
  final String imageUrl;
  final String coinName;
  final String percentagePrice;
  final BoxConstraints constraints;

  const ReusableSellingCard({
    Key? key,
    required this.isFall,
    required this.imageUrl,
    required this.coinName,
    required this.percentagePrice,
    required this.constraints,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.0),
      ),
      elevation: 4.0,
      shadowColor: const Color(0xFF4D84FF).withOpacity(0.7),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 35.0, vertical: 19.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            /// coin avatar
            CircleAvatar(
              backgroundColor: Colors.black.withOpacity(0.5),
              radius: constraints.maxHeight * 0.02,
            ),
            const SizedBox(height: 8.0),
            /// coin name
            Text(
              coinName,
              style: const TextStyle(
                color: Color(0xFF4F5877),
                fontWeight: FontWeight.w500,
                fontSize: 17,
              ),
            ),
            const SizedBox(height: 8.0),
            /// percentage gain or loss
            Container(
              padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 12.0),
              decoration: BoxDecoration(
                color: isFall == false ? const Color(0xFFE2F8EB) : const Color(0xFFFEE6E6),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Text(
                percentagePrice,
                style: TextStyle(
                  color: isFall == false ? const Color(0xFF27AE60) : const Color(0xFFE84343),
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}