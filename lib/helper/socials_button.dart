import 'package:flutter/material.dart';

class SocialsButton extends StatelessWidget {
  final String image;
  final String label;
  final String uri;
  const SocialsButton(
      {super.key, required this.image, required this.label, required this.uri});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: SizedBox(
        height: 36,
        width: 36,
        child: Image.asset(
          image,
          fit: BoxFit.scaleDown,
        ),
      ),
    );
  }
}
