import 'package:flutter/material.dart';

class CustomExpanded extends StatelessWidget {
  const CustomExpanded({
    Key? key,
    required this.size,
    required this.image,
    required this.tempuratureText,
    required this.text,
  }) : super(key: key);

  final Size size;
  final String image;
  final String tempuratureText;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Image.asset(
            image,
            width: size.width * 0.15,
          ),
          Text(
            tempuratureText,
            style: const TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(text,
              style: TextStyle(
                  color: Colors.white.withOpacity(0.6),
                  fontSize: 17,
                  fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
