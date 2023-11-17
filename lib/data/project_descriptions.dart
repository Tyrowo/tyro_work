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
          crossAxisAlignment: WrapCrossAlignment.center,
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

class EquidistantProjectDescription extends StatelessWidget {
  const EquidistantProjectDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            const Text('Published and available for free on the'),
            TextButton(
              onPressed: () async {
                final Uri url = Uri.parse(
                    'https://apps.apple.com/us/app/equidistant/id6470894389?platform=iphone%E2%80%A6');
                if (!await launchUrl(url)) {
                  throw Exception('Could not launch $url');
                }
              },
              child: const Text(
                'iOS App Store,',
              ),
            ),
            const Text('the'),
            TextButton(
              onPressed: () async {
                final Uri url = Uri.parse(
                    'https://play.google.com/store/apps/details?id=com.equidistant');
                if (!await launchUrl(url)) {
                  throw Exception('Could not launch $url');
                }
              },
              child: const Text(
                'Google Play Store,',
              ),
            ),
            const Text('and'),
            TextButton(
              onPressed: () async {
                final Uri url = Uri.parse('https://equidistant.app');
                if (!await launchUrl(url)) {
                  throw Exception('Could not launch $url');
                }
              },
              child: const Text(
                'on the Web.',
              ),
            ),
          ],
        ),
        const Text(''),
        const Text(
            "Following my work on the Procrastination Buster I was confident that my development skills had reached a point where I felt ready to apply for work."),
        const Text(
            "I was hired to Birlasoft Solutions Inc as a software developer, and for a year and a half I focused on improving my proficiency at Java so that I would be more successful professionally, and taking care of my physical health (primarily by going out and playing disc golf)."),
        const Text(
            "But during that time I kept a list of ideas for projects I wanted to work on. I wanted to dip my toes into phone app development, because our phones are a constant tool we use in our lives, even moreso than computers for most."),
        const Text(''),
        const Text(
            "At Birlasoft we worked remote, but many of us were local to the area. So we had a tradition where we would meet up for lunch on Fridays to socialize a bit."),
        const Text(
            "However, I noticed that my coworker who was planning the lunches tended to pick restaurants that were extremely close to his house, and that often left me excluded. I was a little further from town, so while most people had a 5-15 minute drive to the restaurant, I would often have to drive 45 minutes, which meant usually I was unable to come."),
        const Text(
            'I thought "what if there were a way to pick out a nice restaurant somewhere where we could all meet?"'),
        const Text(''),
        const Text(
            "Eventually I would revisit this idea, and found that although some web apps had a similar idea, they were always restricted to only two addresses."),
        const Text(
            "I found that it wasn't too hard to calculate a position using more addresses, and that it would be a more satisfying solution to my problem."),
        const Text(
            "On top of that I thought of another problem - what if the people didn't want to share their home addresses with each other?"),
        const Text(
            "Coworkers, first dates, social clubs, ecommerce. There are many situations in which you need to meet up with people somewhere convenient, but can't expose yourself to some random person showing up at your house."),
        const Text(''),
        const Text("So to address these issues I created Equidistant."),
        const Text(''),
        const Text(
            "Initially my plan was to learn Kotlin, but heard more and more about Flutter and loved the idea of releasing to multiple platforms. The write-once-run-anywhere design was very appealing, as was the fact that it is supported by Google."),
        const Text(
            "So I spent nearly two months watching through an intro-to-Flutter project creation video, and going through a video explaining ~215 widgets that might be useful to me."),
        const Text(
            "After doing all that this project was my first real hands-on experience with Flutter."),
        const Text(''),
        const Text(
            "After all my preperation, putting together the pieces was easy. It felt like putting together a Lego set that I had written all the instructions for."),
        const Text(
            "I had to do a little extra learning on how to implement Google Cloud APIs, as well as how to use Firebase database to effectively implement CRUD operations for the Privacy Mode of the app."),
        const Text(
            "My partner Jill was a huge help - she had completed a Google UX Design course, and used her knowledge to help consult with me on design decisions and make sure that the UX was intuitive."),
        const Text(
            "Since I felt confident in myself from my profession, I also brought on two of my friends who have been learning to code so that I could give them the chance to work with a group repository and broaden their experiences."),
        const Text(
            "It was a great opportunity for me as well, learning how to delegate manageable project tasks to them, since at work I'm still one of the most junior developers on my team."),
        const Text(''),
        const Text(
            "As a retrospective for the project, I adore working with Flutter. "),
        const Text(
            "The Dart syntax is very readable to me because it feels like a midway between my experiences with Java and Javascript. "),
        const Text(
            "Flutter's VSCode IDE implementation is exceptional, and the hot reload feature is a huge breath of fresh air as a developer."),
        const Text(
            "Although some features need to be a little platform specific (I was coding for Android, but on iOS certain Google links did not work natively, and on Web I ran into issues with CORS preventing some of my Cloud API calls to Google Maps), overall there was minimal work to build to all three platforms, and submission to the stores proceeded smoothly."),
        const Text("All in all it left me very impressed with the framework."),
        const Text(''),
        const Text(
            "I'm very happy to be an official developer on both the Play and App stores, and quite proud of this project."),
        const Text(
            "If you think it may be of use to you, please consider giving it a download!"),
        const Text(''),
        const ElevatedButton(
            onPressed: null,
            child: Text(
                'My Github is private for this project to protect my API keys',
                style: TextStyle(color: Colors.grey)))
      ],
    );
  }
}

class Web1Description extends StatelessWidget {
  const Web1Description({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            const Text('Published and available for free on the'),
            TextButton(
              onPressed: () async {
                final Uri url = Uri.parse(
                    'https://apps.apple.com/us/app/equidistant/id6470894389?platform=iphone%E2%80%A6');
                if (!await launchUrl(url)) {
                  throw Exception('Could not launch $url');
                }
              },
              child: const Text(
                'iOS App Store,',
              ),
            ),
            const Text('the'),
            TextButton(
              onPressed: () async {
                final Uri url = Uri.parse(
                    'https://play.google.com/store/apps/details?id=com.equidistant');
                if (!await launchUrl(url)) {
                  throw Exception('Could not launch $url');
                }
              },
              child: const Text(
                'Google Play Store,',
              ),
            ),
            const Text('and'),
            TextButton(
              onPressed: () async {
                final Uri url = Uri.parse('https://equidistant.app');
                if (!await launchUrl(url)) {
                  throw Exception('Could not launch $url');
                }
              },
              child: const Text(
                'on the Web.',
              ),
            ),
          ],
        ),
        const Text(''),
        const Text(
            "When I started learning how to code I wasn't sure if I wanted to be more of a front end developer or back end developer."),
        const Text(
            "I decided to try out everything, and to do so I started learning how to code in Javascript."),
        const Text(
            'When I asked a friend whether I should learn a framework like React, he gave me the advice "sure, just don\'t start coding anything in react that you wouldn\'t know how to make in vanilla js."'),
        const Text(
            "I may have gone a little overboard, because I decided to code a website as a little sandbox area to test javascript projects, and decided to do it in 100% vanilla html/css + js."),
        const Text(
            "The results were basic, and the project convinced me I would prefer to be more of a backend developer than a front end developer. 😹"),
        const Text(
            "But it was nice to build something to start with, and learning the core design of css properties has made my life a lot easier working on other projects since."),
        const Text(''),
        const Text(
            "While it was a little basic, I put a lot of love into some of the components."),
        const Text(
            "In particular, I designed the notepad sheet sections to represent the piles of notebooks I had filled during my coding self-study over the previous months."),
        const Text(''),
        const Text(
            "My font I actually created prior to the website, it was a project where I wanted to use my actual handwriting as a font for use in documents."),
        const Text(
            "I created it with a web app called calligraphr, and went through tons of iterations creating variations of the lettering that would make it as natural looking as possible."),
        const Text(
            "My intent was to have it published as a Google Font, but unfortunately fonts created through Calligraphr are not supported because they don't have the component files."),
        const Text(''),
        const Text(
            "My intent is to one day return to this project, because I would love to have it publicly available and use it on my googledocs. "),
        const Text(
            "But it will require starting almost completely from scratch, so it's definitely on the backburner for now."),
        const Text(''),
        const Text(
            "However, it's still available as is for personal use, and I love that I can inscribe my actual handwriting onto the internet."),
        const Text(''),
        const Wrap(
          children: [
            Text('Tyrowo Inked is available at'),
            ElevatedButton(
              onPressed: null,
              child: Text(
                'Github Repository',
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class Web2Description extends StatelessWidget {
  const Web2Description({super.key});

  @override
  Widget build(BuildContext context) {
    // need device width and height in these to change pic size
    double deviceWidth(BuildContext context) =>
        MediaQuery.of(context).size.width;
    double deviceHeight(BuildContext context) =>
        MediaQuery.of(context).size.height;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            const Text('Published and available for free on the'),
            TextButton(
              onPressed: () async {
                final Uri url = Uri.parse(
                    'https://apps.apple.com/us/app/equidistant/id6470894389?platform=iphone%E2%80%A6');
                if (!await launchUrl(url)) {
                  throw Exception('Could not launch $url');
                }
              },
              child: const Text(
                'iOS App Store,',
              ),
            ),
            const Text('the'),
            TextButton(
              onPressed: () async {
                final Uri url = Uri.parse(
                    'https://play.google.com/store/apps/details?id=com.equidistant');
                if (!await launchUrl(url)) {
                  throw Exception('Could not launch $url');
                }
              },
              child: const Text(
                'Google Play Store,',
              ),
            ),
            const Text('and'),
            TextButton(
              onPressed: () async {
                final Uri url = Uri.parse('https://equidistant.app');
                if (!await launchUrl(url)) {
                  throw Exception('Could not launch $url');
                }
              },
              child: const Text(
                'on the Web.',
              ),
            ),
          ],
        ),
        const Text(''),
        const Text(''),
        const ElevatedButton(
          onPressed: null,
          child: Text(
            'Github Repository',
            style: TextStyle(color: Colors.grey),
          ),
        ),
      ],
    );
  }
}
