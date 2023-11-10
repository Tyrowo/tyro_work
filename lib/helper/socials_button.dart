import 'package:flutter/material.dart';

class SocialsButton extends StatelessWidget {
  final String image;
  final String label;
  final String uri;
  const SocialsButton(
      {super.key, required this.image, required this.label, required this.uri});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32,
      width: 32,
      child: Image.asset(
        image,
        fit: BoxFit.scaleDown,
      ),
    );
  }
}
