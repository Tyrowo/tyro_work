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
        const ResizeableImage(
            asset: 'assets/pics/probuster.jpg',
            label:
                'Screenshot of my Chrome Extension called The Procrastination Buster'),
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
        const Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            ResizeableImage(
                asset: 'assets/pics/eqScreenshot01.png',
                label: 'Homepage of my app called Equidistant'),
            ResizeableImage(
                asset: 'assets/pics/eqScreenshot02.png',
                label: 'Privacy mode screen of the app Equidistant'),
            ResizeableImage(
                asset: 'assets/pics/eqScreenshot03.png',
                label: 'Results screen of the app Equidistant'),
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
        const Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            ResizeableImage(
                asset: 'assets/pics/firstWebsite01.png',
                label: 'Screenshot of the homepage of my first website'),
            ResizeableImage(
                asset: 'assets/pics/firstWebsite02.png',
                label: 'Screenshot of my first website'),
          ],
        ),
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
            "I created it with a web app called calligraphr, and went through tons of iterations creating variations of the lettering that would make it as natural looking as possible. In all I created over 116 of these handwritten character sheets."),
        const ResizeableImage(
            asset: 'assets/pics/handwritingCharacters.jpg',
            label: 'A sheet of handwritten characters'),
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
            "When I decided that I would learn how to use Flutter, it was exciting to have a new framework under my belt that I could apply to updating my portfolio."),
        const Text(
            "Not that I wasn't ... proud of what I was able to accomplish with vanilla html+css+js, but the results also weren't anything I was very excited to show off, either. 😹"),
        const Text(
            "As a web-only project, this was also a great opportunity to experiment with Flutter's WASM (web assembly) build option. It doesn't seem totally fleshed out yet but could be even more interesting as it advances in the coming years."),
        const Text(''),
        const Text(
            "Working with Flutter on a second project was an awesome experience, because I was able to pull in a lot of work that I had done on Equidistant, I had researched some of the features I wanted to implement, and I already knew how to deploy my code to web."),
        const Text(
            "It made development a breeze, and all in all it only took about two weeks (despite a concurrent stay in the hospital) to develop the page you're looking at now."),
        const Text(
            "I also felt like my coding through this project was more clean and organized, because I was more confident in how Flutter allows stateful widgets to be self contained into their own classes rather."),
        const Text(
            "I did add a sort of handicap though - I wanted to work with as much ootb content as possible, and minimize the use of packages sourced from pub.dev. That way I could rely on my own widget composition skills a little more."),
        const Text(''),
        const Text(
            "Flutter is really a pleasure to work with, and I really enjoyed creating class based components that I could resuse throughout the page. "),
        const Text(
            "Customizing properties is a breeze, and simple ternaries were enough to create breakpoints to ensure responsive design on various device widths."),
        const Text(''),
        const Text(
            "However, Flutter Web has some notable drawbacks that I've discovered."),
        const Text(
            "The primary issue is that it's not compatible with webcrawlers, which heavily impairs its SEO potential and prevents pages from coming up on Google search results without any extra effort."),
        const Text(
            "I'm in the process of researching how I can correct this, but it being a hurdle at all is a major shortcoming for development."),
        const Text(
            "There are also some random issues with Flutter UI that I've noticed - it seems that Flutter is pretty Mac oriented. I say that because, as a Windows user, I noticed that you can't use the middle mouse button to click-scroll, and without a designated package (most of which are very poorly reviewed) there is no workaround for this."),
        const Text(
            "Finally, although I don't really mind the bootup time to run Flutter, and have found it to be pretty comparable to webtool created portfolio sites, it's a little excessive for a small page like mine."),
        const Text(''),
        const Text(
            "For these reasons this will probably be my final web-only Flutter project, at least until some substantial WASM improvements are made."),
        const Text("Surprise surprise, Flutter is an app framework."),
        const Text(
            "However, I'm sure the experience with class based web development will be invaluable working with other frameworks in the future, and I'm very happy with the results."),
        const Text(''),
        const Text(
            "Speaking to the themes of this project, my biggest feedback with my last website design was that it was too loud."),
        const Text(
            "However, I loved the color scheme as accent colors for a more light/dark theme that wouldn't be as gaudy."),
        const Text(
            "I also to experiment with customization, allowing users to be able to toggle off my font if it wasn't readable enough for them, as well as toggle light/dark."),
        const Text(''),
        const Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            ResizeableImage(
                asset: 'assets/pics/lightModeColor.png',
                label: 'Light mode color palette from snow leopard print'),
            ResizeableImage(
                asset: 'assets/pics/darkModeColor.png',
                label: 'Dark mode color palette from snow leopard print'),
          ],
        ),
        const Text(
            "In classic Tyler fashion I wanted to create a really personal feel to this website, and that's where the leopard print theme comes into play."),
        const Text(
            "With the rise of AI, I was impressed with image generation tools available for public use, and one thing that I've noticed in the commercial sector is that many leopard prints are excessively simplistic and unrealistic in design."),
        const Text(
            "They're too consistent in pattern, where real leopard print is a camoflauge of varied patterns across the head, back, sides of the cat."),
        const Text(
            "So what I wanted to accomplish was to create a more realistic leopard print pattern using Midjourney. I chose Midjourney in particular because they explicitly state that you own the rights to any images produced with the tool."),
        const Text(
            "To do that I tested the potential by using some publicly available images of snow leopards on the internet, but my issues with using these images were that they were poor models for the AI, they were low resolution, and ethically they weren't my images to use and base My designs off of."),
        const Text(
            "So on a trip to visit some friends in San Francisco, I took a trip to the zoo."),
        const Text(
            "It was my first opportunity to see a snow leopard in person, so I spent the day there trying to shoot pictures on my Pixel 4."),
        const Text(
            "What a journey that was. I navigated the public transit and arrived just past noon to an empty exhibit. But after a while of looking I discovered the cat asleep by the wall interior, barely visible."),
        const Text(
            "Any time he shifted positions I snapped some pics of his back, but I knew they were barely useable."),
        const ResizeableImage(
            asset: 'assets/pics/cat01waiting.jpg',
            label: 'Snow leopard from a distance inside a building'),
        const Text(
            "So I waited. I sat outside the snow leopard exhibit until 5 PM, patiently rationing my phone battery life to mitigate my boredom."),
        const Text(
            "I thought, 'Surely he would leave the interior area to use the bathroom eventually.' But no."),
        const Text(
            "I learned from a zookeeper that the cat's name was Jimmy G, and at 5 PM when another zookeeper came to bring him his food Jimmy finally woke up."),
        const Text("He ate his food, and began to do laps around his exhibit."),
        const Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            ResizeableImage(
                asset: 'assets/pics/cat03face.jpg',
                label: 'Snow leopard facing the camera'),
            ResizeableImage(
                asset: 'assets/pics/cat04walking.jpg',
                label: 'Snow leopard walking through his habitat'),
            ResizeableImage(
                asset: 'assets/pics/cat05crouching.jpg',
                label: 'Snow leopard crouched against a wall'),
          ],
        ),
        const Text(
            "I ran alongside him, furiously snapping as many pictures as I could in as many poses as I could, with a focus on trying to get a broad view of his side for an optimal look at the print on his side."),
        const ResizeableImage(
            asset: 'assets/pics/cat02body.jpg',
            label: 'Broadside of a snow leopard'),
        const Text(
            "I took pictures until my phone died, watched him until he finished his rounds, and he promptly went back to sleep."),
        const Text(''),
        const Text(
            "When I got home I selected the cleanest pictures I could find of the print, cropped them, and used them as a model for Midjourney to base the results of my prompt on."),
        const Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            ResizeableImage(
                asset: 'assets/pics/training1.jpg',
                label: 'Cropped body of a snow leopard'),
            ResizeableImage(
                asset: 'assets/pics/training2.jpg',
                label: 'Cropped body of a snow leopard'),
          ],
        ),
        const Text(
            "Creating a smooth tiling image was difficult with an inconsistent design, but after generating a hundred images or so, I had 6 perfect images to use for this project."),
        const Text(
            "See, I didn't want just one tiled image. If you haven't noticed yet, I wanted to create a background that randomized every time you load this page."),
        const Text(
            "As modern web design moves towards simple plain backgrounds, I wanted mine to be a little more subtly dynamic and engaging to repeat visitors."),
        const Text(
            "I think the results speak for themselves. I find it very visually appealing, and it served as a great basis for the off-black and off-white color scheme."),
        const ResizeableImage(
            asset: 'assets/4.png', label: 'Tiled snow leopard pattern image'),
// [color palette references]
        const Text(''),
        const Text(
            "So here's a quick shoutout to my model and basis for this website, Jimmy G."),
        const Text(
            "Thanks for allowing me the opportunity to ethically source the images myself. "),
        const Text("Hope you're doing well. 💕"),
        const ResizeableImage(
            asset: 'assets/pics/cat06posed.jpg',
            label: 'Snow leopard sitting on a large rock'),
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
