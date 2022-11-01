import 'package:flutter/material.dart';

class CustomExpanded2 extends StatelessWidget {
  const CustomExpanded2({
    Key? key,
    required this.text1,
    required this.text2,
    required this.text3,
    required this.text4,
  }) : super(key: key);
  final String text1;
  final String text2;
  final String text3;
  final String text4;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          sizedboxHeight(),
          Text(
            text1,
            style:
                TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 20),
          ),
          sizedboxHeight(),
          Text(
            text2,
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
          sizedboxHeight(),
          Text(
            text3,
            style:
                TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 20),
          ),
          sizedboxHeight(),
          Text(
            text4,
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
        ],
      ),
    );
  }

  SizedBox sizedboxHeight() {
    return const SizedBox(
      height: 5,
    );
  }
}
