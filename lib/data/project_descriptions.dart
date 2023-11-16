import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProBusterProjectDescription extends StatelessWidget {
  const ProBusterProjectDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          children: [
            const Text("Published and publicly available on"),
            TextButton(
              onPressed: () async {
                final Uri url = Uri.parse(
                    'https://chrome.google.com/webstore/detail/tyrowos-procrastination-b/ecdedcllldeigficjfdbjgepojogaepe?hl=en-GB');
                if (!await launchUrl(url)) {
                  throw Exception('Could not launch $url');
                }
              },
              child: const Text(
                'the Chrome Web Store.',
              ),
            ),
            const Text(
                '(You may be required to log in to a Google account to see the page.)')
          ],
        ),
        const Text(''),
        const Text(
            "After publishing my website I wanted to create something that was more Javascript oriented."),
        const Text(
            "I had a personal need for a product - I was spending too much time on endless-content websites like reddit and twitch, and I wanted to manage my time more efficiently so I could focus on my studies."),
        const Text(
            "However, the built in website blocker in Chrome wasn't enough. I knew that if the website was Always blocked, then I would simply circumnavigate my own barriers by either using incognito mode or another browser."),
        const Text(
            "So I decided to design a sort of child-protection web blocker that allowed a trickle feed of content at a customizable rate."),
        const Text(
            "For example, once I completed the project I used it to allow myself a half hour of reddit every 24 hours."),
        const Text(''),
        const Text(
            "Since developing this Chrome extension there have been many more sophisticated tools that accomplish the same goal more effectively, but at the time I was working on this Chrome Manifest v3 had just come out."),
        const Text(
            "The new APIs and restrictions of Manifest v3 prevented a lot of extensions from working the way they had before, and so there weren't any extensions on the chrome store yet that accomplished what I needed."),
        const Text(
            "It was difficult working through the service worker based system that Manifest v3 implemented to create more permanent states in my Chrome extension, but working with the APIs and using the Chromium forums taught me a lot."),
        const Text(
            "Many others on the forums were working through the same newfound struggles with Manifest v3 that I was, and collaborating with them on solutions to our issues proved to be very satisfying."),
        const Text(
            "Furthermore, the work I had done on my website project made the UI implementation easy, so I was able to focus almost entirely on improving my Javascript skills on this project."),
        const Text(''),
        ElevatedButton(
            onPressed: () async {
              final Uri url =
                  Uri.parse('https://github.com/Tyrowo/procrastinationBuster');
              if (!await launchUrl(url)) {
                throw Exception('Could not launch $url');
              }
            },
            child: const Text('Github Repository')),
      ],
    );
  }
}
