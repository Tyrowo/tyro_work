import 'package:flutter/material.dart';
import 'package:tyro_work/helper/resizeable_image.dart';
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
        const Center(
          child: ResizeableImage(
            asset: 'assets/pics/probuster.jpg',
            label:
                'Screenshot of my Chrome Extension called The Procrastination Buster',
            imagesInWrap: 1,
          ),
        ),
        const Text(''),
        const Text(
            "After publishing my website I wanted to create something that was more Javascript oriented to act as my first \"real\" project as a developer."),
        const Text(
            "At the time I was spending too much time on endless-content websites like Reddit and Twitch, and I wanted to manage my time more efficiently so I could focus on my studies. However, the built-in website blocker in Chrome wasn't satisfying. I knew that if the website was Always blocked, then I would simply circumnavigate my own barriers by either using incognito mode or another browser. So I wanted to design a sort of child-protection web blocker that would allow a trickle feed of content at a customizable rate. (Once I completed the project I used the extension to allow myself a half hour of Reddit or Twitch every 24 hours.)"),
        const Text(''),
        const Text(
            "Since developing this Chrome extension there have been many more sophisticated tools that accomplish the same goal more effectively, but at the time I was working on this Chrome Manifest v3 had just released. The new APIs and restrictions of Manifest v3 prevented a lot of extensions from working the way they had before, and so there weren't any extensions on the Chrome Store that accomplished what I wanted with the new platform."),
        const Text(
            "It was difficult working through the Service Worker based system that Manifest v3 implemented to create more permanent states in my Chrome extension, but working with the APIs and using the Chromium forums taught me a lot. Many other developers were working through the same newfound struggles with Manifest v3 that I was. Collaborating with them on solutions to our issues proved to be very satisfying."),
        const Text(
            "Ultimately I created a solution where users customize a list of websites that created listeners that would be active while the extension was on. If the user accessed a website on their block list it would set up a Manifest v3 Alarm for the amount of time they had specified. At the end of the alarm it would block the website using Declarative Net Request website prohibition. Another alarm would be set up that would disable the prohibition. While this solution worked in most use cases, it was definitely a fight with the Manifest v3 service worker system. For long periods of time (like if you only allowed yourself once per week) the service workers would 'forget' their own existence and drop alarms or blockers if you stopped using Chrome. The experience made me understand why most browser extensions to this day rely on the Manifest v2 platform instead, and I'm interested in what will happen to Chrome once v2 is officially deprecated in a few months."),
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
        /** 
         * this format lets you have guaranteed in-line link text, but unfortunately it doesn't have the nice hover animation for the text links
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                  style: Theme.of(context).textTheme.bodyMedium,
                  text: 'Published and available for free on the'),
              TextSpan(
                style: Theme.of(context).textButtonTheme
                    .bodyMedium!
                    .copyWith(color: const Color.fromRGBO(28, 146, 245, 1)),
                text: ' iOS App Store, ',
                recognizer: TapGestureRecognizer()
                  ..onTap = () async {
                    final Uri url = Uri.parse(
                        'https://apps.apple.com/us/app/equidistant/id6470894389?platform=iphone%E2%80%A6');
                    if (!await launchUrl(url)) {
                      throw Exception('Could not launch $url');
                    }
                  },
              ),
            ],
          ),
        ),
        */
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
        const Center(
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            alignment: WrapAlignment.center,
            runSpacing: 15.0,
            spacing: 15.0,
            children: [
              ResizeableImage(
                asset: 'assets/pics/eqScreenshot01.png',
                label: 'Homepage of my app called Equidistant',
                imagesInWrap: 3,
              ),
              ResizeableImage(
                asset: 'assets/pics/eqScreenshot02.png',
                label: 'Privacy mode screen of the app Equidistant',
                imagesInWrap: 3,
              ),
              ResizeableImage(
                asset: 'assets/pics/eqScreenshot03.png',
                label: 'Results screen of the app Equidistant',
                imagesInWrap: 3,
              ),
            ],
          ),
        ),
        const Text(''),
        const Text(
            "I was hired to Birlasoft Solutions Inc as a backend developer, and for a year and a half I focused on improving my Java skills so that I would be successful at work. However, app development was something I was interested in learning for a long time. Almost every person in the world uses a smart phone in their daily lives, and working on ways to make these tools more useful is immensely appealing to me."),
        const Text(''),
        const Text(
            "At Birlasoft we work remote, but many of us are local to the area. So we try to meet up for lunch on Fridays to socialize a bit. Unfortunately I live a little further out of town, so I noticed that when my coworkers would pick restaurants close to their houses, the 45 minute commute for me usually meant that I was unable to come. So I thought, \"What if there was an easy way to pick out a restaurant that was convenient to meet at for all of us?\""),
        const Text(''),
        const Text(
            "It was a simple idea, but when I explored the internet for existing web apps I found that existing tools like meetways.com and whatshalfway.com are restricted to only two addresses. That doesn't really work for meeting up with a group of people, so I was excited that my idea would actually be worth developing for this use case. On top of that I thought of another problem - what if the people using the app didn't want to share their home addresses with each other? When meeting up with coworkers, Tinder dates, social clubs, or ecommerce like Craigslist you don't want to expose yourself to some random person knowing where you live. So I expanded the scope to have a Privacy Mode in which you could calculate a meetup point without directly sharing information."),
        const Text(''),
        const Text(
            "It took a few months of planning, learning, and development, but ultimately I was able to publish Equidistant to accomplish my vision."),
        const Text(''),
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            const Text(
                'As an Android purist I initially started learning Kotlin, but caught wind of Flutter and loved the its write-once-run-anywhere design, the thorough documentation in written and video form, and the fact that it is officially supported by Google. I spent nearly two months preparing by watching through an'),
            TextButton(
              onPressed: () async {
                final Uri url = Uri.parse(
                    'https://www.youtube.com/watch?v=IfUjHNODRoM&list=PL6yRaaP0WPkVtoeNIGqILtRAgd3h2CNpT&index=1');
                if (!await launchUrl(url)) {
                  throw Exception('Could not launch $url');
                }
              },
              child: const Text(
                'intro-to-Flutter',
              ),
            ),
            const Text(
                'project creation video series, as well as a video detailing'),
            TextButton(
              onPressed: () async {
                final Uri url =
                    Uri.parse('https://www.youtube.com/watch?v=kj_tldMmu4w');
                if (!await launchUrl(url)) {
                  throw Exception('Could not launch $url');
                }
              },
              child: const Text(
                '~215 widgets',
              ),
            ),
            const Text(
                'that might be useful. I knew it would be much easier to design my product if I knew all the tools I had available to me.')
          ],
        ),
        const Text(
            "I only took notes on the videos I watched, so Equidistant was my first real hands-on experience with Flutter. But thanks to all my preparation and how fluidly VSCode provides documentation while you're coding, putting together the pieces was easy. I felt like a kid using a big pool of Legos to build something from my imagination."),
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            const Text(
                'After doing the groundwork for the app, I had to do a little extra learning on how to implement Google Cloud APIs, as well as how to use Firebase Realtime Database to effectively implement CRUD operations I had envisioned for the Privacy Mode. But again, I love working with Google products for the extremely helpful'),
            TextButton(
              onPressed: () async {
                final Uri url =
                    Uri.parse('https://www.youtube.com/watch?v=sXBJZD0fBa4');
                if (!await launchUrl(url)) {
                  throw Exception('Could not launch $url');
                }
              },
              child: const Text(
                'video documentation.',
              ),
            ),
          ],
        ),
        const Text(
            "Another huge facilitator was my partner Jill, who acted as my UX Designer for the project. She had completed a Google UX Design course, so I was able to offload many of the UX and design decisions to her so that I could leave my mental capacity open to focus on developing the code."),
        const Text(
            "I also brought on two of my friends as junior developers: Steven and Flare. They'd both been learning to code the year prior to me starting the project, and I wanted to give them the opportunity to work with a group repository and broaden their experiences. But working on a team rather than completely on my own was a great opportunity for me as well. At work I'm still one of the most junior developers on my team, so I'm glad I had the chance to learn how to delegate manageable project tasks and get more practice in code reviewing their solutions."),
        const Text(''),
        const Text(
            "As a retrospective for the project, I adore working with Flutter. The Dart syntax is very intelligible to me because it feels like a midway between my experiences with Java and Javascript. Flutter's VSCode IDE implementation is exceptional, and the hot reload feature is a huge breath of fresh air as a developer. Although a few of my features required platform-specific solutions (I was coding for Android, but on iOS certain Google links did not work natively, and on Web I ran into issues with CORS preventing some of my Cloud API calls to Google Maps), overall there was minimal work in building to all three platforms. Submission to the App and Play stores proceeded smoothly, which was a huge relief after hearing some discouraging anecdotes from friends who had worked in React Native."),
        const Text(
            "All in all the experience left me very impressed with the framework, and happy I had taken the time to learn it."),
        const Text(''),
        const Text(
            "I'm very proud to be an official developer on both the Play and App stores, and quite proud of this project. So if you think it may be of use to you, please consider giving it a download!"),
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
        const Center(
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            alignment: WrapAlignment.center,
            runSpacing: 15.0,
            spacing: 15.0,
            children: [
              ResizeableImage(
                asset: 'assets/pics/firstWebsite01.png',
                label: 'Screenshot of the homepage of my first website',
                imagesInWrap: 2,
              ),
              ResizeableImage(
                  asset: 'assets/pics/firstWebsite02.png',
                  label: 'Screenshot of my first website',
                  imagesInWrap: 2),
            ],
          ),
        ),
        const Text(''),
        const Text(
            "When I started learning how to code I wasn't sure if I wanted to be more of a front end developer or back end developer. I decided to try out everything, and to do so I started learning how to code in Javascript."),
        const Text(
            "I thought about picking up React early on, but decided to code a website 100% vanilla html/css + js first. Nothing crazy, just a little sandbox area to test javascript projects. The results were unsurprisingly pretty elementary in design, and the project actually convinced me I would prefer to be more of a backend developer than a front end developer."),
        const Text(
            "But it was nice to build something to start with, and learning the core design of css properties has made my life a lot easier working on other projects since."),
        const Text(
            "Rather than focus on recreating elements of successful web design, I worked on making personalized components. The notepad sheet sections represented the piles of notebooks I had filled during my coding self-study over the previous months, and highlighted my handwriting font. I had created a font of my handwriting earlier that year with a web app called Calligraphr, and went through tons of iterations creating variations of the lettering that would make it as natural looking as possible. In all I created over 116 of these handwritten character sheets."),
        const Text(''),
        const Center(
          child: ResizeableImage(
            asset: 'assets/pics/handwritingCharacters.jpg',
            label: 'A sheet of handwritten characters',
            imagesInWrap: 1,
          ),
        ),
        const Text(''),
        const Text(
            "My intent was to have it published as a Google Font, but unfortunately fonts created through Calligraphr are not supported because they don't have the component files. One day I hope to return to this project, because I would love to have it publicly available and use it on my Google Docs. Unfortunately, it will probably require starting almost completely from scratch, so it's definitely on the backburner for now."),
        const Text(''),
        const Text(
            "However, Tyrowo Inked as it is still works great for my personal use, and I was even using it in my IDE for a while. 😹 For projects like my portfolio websites I love that I can inscribe my actual handwriting onto the internet. It's my way of saying, \"This is me. I was here.\""),
        const Text(''),
        Wrap(
          children: [
            const Text('Tyrowo Inked font '),
            ElevatedButton(
              onPressed: () async {
                final Uri url =
                    Uri.parse('https://github.com/Tyrowo/TyrowoInked');
                if (!await launchUrl(url)) {
                  throw Exception('Could not launch $url');
                }
              },
              child: const Text(
                'Github Repository',
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Wrap(
          children: [
            const Text('Website 1.0 '),
            ElevatedButton(
              onPressed: () async {
                final Uri url = Uri.parse('https://github.com/Tyrowo/website');
                if (!await launchUrl(url)) {
                  throw Exception('Could not launch $url');
                }
              },
              child: const Text(
                'Github Repository',
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
            "After learning how to use Flutter to make Equidistant, applying the things I had learned towards making a more sophisticated portfolio website was an obvious followup project."),
        const Text(
            "Working with Flutter on a second project was an awesome experience. I was able to pull in a lot of work that I had done on Equidistant, I had already researched some of the features I wanted to implement, and I already knew how to deploy my code to web. All of that and plenty of forethought on how I wanted to design the site made development a breeze. Despite a concurrent stay in the hospital, it only took about two weeks to launch the first draft of the page. I also felt like my coding through this project was more clean and organized, and I was much more confident in how I could spread my work into reusable self contained classes and components. I also added a sort of handicap to my work - I wanted to work with as much ootb content as possible, and minimize the use of packages sourced from pub.dev. That way I could rely on my own widget composition skills a little more. Customizing properties is a breeze, and simple ternaries were enough to create breakpoints to ensure responsive design on various device widths."),
        const Text(''),
        const Text(
            "However, Flutter Web has some notable drawbacks as well. My primary issue is that Flutter created web apps are not compatible with webcrawlers, which heavily impairs SEO potential and can potentially prevent pages from coming up on Google search results completely. I'm in the process of researching how I can best correct this, but it being a hurdle at all is a major shortcoming for development. There are also some random issues with Flutter UI that I've noticed - it seems that Flutter is pretty Mac oriented. I say that because, as a Windows user, I noticed that you can't use the middle mouse button to click-scroll, and from the packages I've looked at there doesn't seem to be a very satisfying workaround. Finally, although I don't really mind the bootup time to run Flutter, and I've observed that the launch time is pretty comparable to no-code webtool created portfolio sites, the fact is that having any kind of boot up time makes it a poor use case for a small page like mine."),
        const Text(
            "For these reasons this will probably be my final web-only Flutter project. However, I'm currently experimenting with deploying this project in Web Assembly mode, and as advancements are made in that area of Flutter it may make an impact on any of these issues."),
        const Text(
            "Ultimately Flutter is an app framework, so these shortcomings were to be expected. And in fact, they actually were not as bad as I expected from reading Flutter forums. Regardless, I'm sure the experience with class based web development will be invaluable working with other frameworks in the future, and I'm very happy with the results."),
        const Text(''),
        const Text(
            "My main goal with the design was to create a really personal feel to this website. Something that is clearly outside the realm of \"normal,\" without being obnoxious. Modern web design has universally embraced image-free off-white backgrounds that remind me of the American Psycho business card scene. Snow leopards are my favorite animal, so to stand apart from this trend I wanted to use AI image generation to create a number of similar-but-different leopard print tiled patterns that would be randomized and create a subtle difference whenever the page was viewed."),
        const Text(
            "I would hazard to say that every stock leopard print previously in existence has been too simplistic in design to capture the beauty of a leopard's natural camoflauge. It's a difficult thing to accomplish, because prints tend to be too consistent, where real leopards have a variety of patterns across their head, back, and sides. With advancements in AI image generation, I believed it would be possible to create a much more complex pattern that would be able to seamlessly tile but still look more natural than existing patterns."),
        const Text(
            "I chose to work with the AI image tool Midjourney because in their terms of service they explicitly state that with a paid membership you own the rights to any images produced with the tool in perpetuity. In my initial testing I observed how the AI handles text prompts alone, and then tested my idea using publicly available images on the internet as seeds. Although these tests did act as a successful proof-of-concept, the publicly available images were poor models for the AI - they were low resolution, and were too focused on the whole cat rather than the pattern itself. Beyond that, I also felt ethical concerns of whether I could even consider a product \"mine\" if I explicitly did not own the seeded content that my images were based off of."),
        const Text(
            "A few months after these tests I found myself in San Francisco, visiting some friends for a housewarming party. I had a day to myself where I planned on roaming the city, but it struck me that in my research finding pictures I had learned that the San Francisco zoo had one of the only snow leopard exhibits in the world. It was my first opportunity to see a snow leopard in person, so I ran off to the zoo to try to shoot some pictures on my Pixel 4."),
        const Text(
            "After navigating the public transit, I arrived just past noon to a seemingly empty exhibit. Looking intently, I discovered the cat asleep by the wall interior, barely visible. I waited there for hours, watching hundreds of disappointed faces walk by the 'empty' exhibit, and desperately snapped barely-useable pictures of the cat's back whenever he would shift positions and worried that might be the best results I get out of the trip."),
        const Text(''),
        const Center(
          child: ResizeableImage(
            asset: 'assets/pics/cat01waiting.jpg',
            label: 'Snow leopard from a distance inside a building',
            imagesInWrap: 1,
          ),
        ),
        const Text(''),
        const Text(
            "I thought, \"Surely he will leave the interior area to use the bathroom eventually.\" But no. He did not. And as 5 PM rolled around my patiently rationed battery life was starting to dwindle to a point where I had to consider how I would navigate back home. But just when I was about to give up hope and leave, a zookeeper came to bring him a meal! And much to my relief, after eating his food the cat began to do laps around his exhibit. I ran alongside him, furiously snapping as many pictures as I could in as many poses as I could, with a focus on trying to get a broad view of his side to get a good sample of the print."),
        const Text(''),
        const Center(
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            alignment: WrapAlignment.center,
            runSpacing: 15.0,
            spacing: 15.0,
            children: [
              ResizeableImage(
                asset: 'assets/pics/cat03face.jpg',
                label: 'Snow leopard facing the camera',
                imagesInWrap: 3,
              ),
              ResizeableImage(
                asset: 'assets/pics/cat04walking.jpg',
                label: 'Snow leopard walking through his habitat',
                imagesInWrap: 3,
              ),
              ResizeableImage(
                asset: 'assets/pics/cat05crouching.jpg',
                label: 'Snow leopard crouched against a wall',
                imagesInWrap: 3,
              ),
            ],
          ),
        ),
        const Text(''),
        const Center(
          child: ResizeableImage(
            asset: 'assets/pics/cat02body.jpg',
            label: 'Broadside of a snow leopard',
            imagesInWrap: 1,
          ),
        ),
        const Text(''),
        const Text(
            "I took pictures until my phone died, and gleefully watched him until he finished his rounds and promptly went back to sleep. A resounding success! When I got home I selected the cleanest pictures I could find of the print, cropped them, and used them as seed images for my Midjourney prompts."),
        const Text(''),
        const Center(
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            alignment: WrapAlignment.center,
            runSpacing: 15.0,
            spacing: 15.0,
            children: [
              ResizeableImage(
                asset: 'assets/pics/training1.jpg',
                label: 'Cropped body of a snow leopard',
                imagesInWrap: 2,
              ),
              ResizeableImage(
                asset: 'assets/pics/training2.jpg',
                label: 'Cropped body of a snow leopard',
                imagesInWrap: 2,
              ),
            ],
          ),
        ),
        const Text(''),
        const Text(
            "Creating a smooth tiling image was difficult with an inconsistent design, but after generating a hundred images or so with a variety of different variations of seed images and prompts, I was able to procure 6 perfect images to use for this project. I think the results speak for themselves, because I find them very visually appealing. Finally, to make sure the theme didn't feel too busy/gaudy, I used the images to choose nice clean complimentary off-black and off-white color schemes to temper the layout."),
        const Text(''),

        const Center(
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            alignment: WrapAlignment.center,
            runSpacing: 15.0,
            spacing: 15.0,
            children: [
              ResizeableImage(
                asset: 'assets/1.jpg',
                label: 'Tiled snow leopard pattern image',
                imagesInWrap: 3,
              ),
              ResizeableImage(
                asset: 'assets/2.jpg',
                label: 'Tiled snow leopard pattern image',
                imagesInWrap: 3,
              ),
              ResizeableImage(
                asset: 'assets/3.jpg',
                label: 'Tiled snow leopard pattern image',
                imagesInWrap: 3,
              ),
              ResizeableImage(
                asset: 'assets/4.jpg',
                label: 'Tiled snow leopard pattern image',
                imagesInWrap: 3,
              ),
              ResizeableImage(
                asset: 'assets/5.jpg',
                label: 'Tiled snow leopard pattern image',
                imagesInWrap: 3,
              ),
              ResizeableImage(
                asset: 'assets/6.jpg',
                label: 'Tiled snow leopard pattern image',
                imagesInWrap: 3,
              ),
            ],
          ),
        ),
// [color palette references]
        const Text(''),
        const Center(
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            alignment: WrapAlignment.center,
            runSpacing: 15.0,
            spacing: 15.0,
            children: [
              ResizeableImage(
                asset: 'assets/pics/lightModeColor.png',
                label: 'Light mode color palette from snow leopard print',
                imagesInWrap: 2,
              ),
              ResizeableImage(
                asset: 'assets/pics/darkModeColor.png',
                label: 'Dark mode color palette from snow leopard print',
                imagesInWrap: 2,
              ),
            ],
          ),
        ),
        const Text(''),
        const Text(
            "One of the zookeepers told me the snow leopard's name is Jimmy G. So here's a quick shoutout to my model and basis for this website. Thanks for showing up and making my project a success, Jimmy. Hope you're doing well. 💕"),
        const Text(''),
        const Center(
          child: ResizeableImage(
            asset: 'assets/pics/cat06posed.jpg',
            label: 'Snow leopard sitting on a large rock',
            imagesInWrap: 1,
          ),
        ),
        const Text(''),
        ElevatedButton(
          onPressed: () async {
            final Uri url = Uri.parse('https://github.com/Tyrowo/tyro_work');
            if (!await launchUrl(url)) {
              throw Exception('Could not launch $url');
            }
          },
          child: const Text(
            'Github Repository',
          ),
        ),
      ],
    );
  }
}
