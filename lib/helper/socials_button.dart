import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialsButton extends StatelessWidget {
  final String image;
  final String label;
  final String uri;
  const SocialsButton(
      {super.key, required this.image, required this.label, required this.uri});

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: label,
      textStyle: const TextStyle(fontSize: 20, color: Colors.white),
      child: TextButton(
        style: ButtonStyle(
            shape: MaterialStateProperty.all(const CircleBorder()),
            padding: MaterialStateProperty.all(EdgeInsets.zero)),
        // luckily our text button is already styled but we add a nice little circle radius to it
        // on pressed send to social media link provided in constructor
        onPressed: () async {
          final Uri url = Uri.parse(uri);
          if (!await launchUrl(url)) {
            throw Exception('Could not launch $url');
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SizedBox(
            height: 36,
            width: 36,
            child: Image.asset(
              image,
              fit: BoxFit.scaleDown,
            ),
          ),
        ),
      ),
    );
  }
}
