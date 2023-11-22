import 'dart:math';

import 'package:flutter/material.dart';
import 'package:rainbow_color/rainbow_color.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tyro_work/data/think_piece_articles.dart';
import 'package:tyro_work/data/project_descriptions.dart';
import 'package:tyro_work/helper/project_banner.dart';
import 'package:tyro_work/helper/socials_button.dart';
import 'package:tyro_work/helper/themes.dart';
import 'package:tyro_work/helper/think_pieces.dart';
import 'package:url_launcher/url_launcher.dart';

class Homescreen extends StatefulWidget {
  final ValueChanged<bool> updateFont;
  final ValueChanged<bool> updateLight;
  const Homescreen(
      {super.key, required this.updateFont, required this.updateLight});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen>
    with SingleTickerProviderStateMixin {
  int _background = 4;
  bool tyFontOff = false;
  bool darkMode = false;
  double deviceWidth(BuildContext context) => MediaQuery.of(context).size.width;
  double deviceHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;
  final scrollController = ScrollController();
  bool picOpacity = false;
  bool titleOpacity = false;
  late AnimationController controller;
  late Animation<Color> _colorAnim;

  void _randomizeBackground() {
    setState(() {
      _background = Random().nextInt(5) + 1;
    });
  }

  Future<void> checkPrefsLight() async {
    final localStorage = await SharedPreferences.getInstance();
    bool darkModeOn = localStorage.getBool('darkModeOn') ?? false;
    setState(() => darkMode = darkModeOn);
  }

  Future<void> checkPrefsFont() async {
    final localStorage = await SharedPreferences.getInstance();
    bool tyFont = localStorage.getBool('tyFontOff') ?? false;
    setState(() => tyFontOff = tyFont);
  }

  Future<void> fadeInMain() async {
    await Future.delayed(const Duration(milliseconds: 600));
    setState(() => picOpacity = true);
    await Future.delayed(const Duration(milliseconds: 600));
    setState(() => titleOpacity = true);
  }

  @override
  void initState() {
    super.initState();
    checkPrefsFont();
    checkPrefsLight();
    _randomizeBackground();
    fadeInMain();
    controller = AnimationController(
        duration: const Duration(milliseconds: 8069), vsync: this);
    _colorAnim = RainbowColorTween([
      const Color.fromRGBO(28, 146, 245, 1),
      const Color.fromRGBO(251, 80, 201, 1),
      const Color.fromRGBO(251, 80, 201, 1),
      const Color.fromRGBO(251, 80, 201, 1),
      const Color.fromRGBO(251, 80, 201, 1),
      const Color.fromRGBO(251, 80, 201, 1),
      const Color.fromRGBO(7, 214, 105, 1),
      const Color.fromRGBO(7, 214, 105, 1),
      const Color.fromRGBO(7, 214, 105, 1),
      const Color.fromRGBO(7, 214, 105, 1),
      const Color.fromRGBO(7, 214, 105, 1),
      const Color.fromRGBO(28, 146, 245, 1),
      const Color.fromRGBO(28, 146, 245, 1),
      const Color.fromRGBO(28, 146, 245, 1),
      const Color.fromRGBO(28, 146, 245, 1),
      const Color.fromRGBO(28, 146, 245, 1),
    ]).animate(controller)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.reset();
          controller.forward();
        } else if (status == AnimationStatus.dismissed) {
          controller.forward();
        }
      });
    controller.forward();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          clipBehavior: Clip.antiAlias,
          leading: Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 0.0),
            child: Image.asset('assets/ty48.png'),
          ),
          title: Row(
            // crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Text(
                'TyRowo',
                style: const TextStyle(
                    fontSize: 20.0,
                    fontFamily: 'Tyrowo Inked',
                    fontWeight: FontWeight.w600),
                textScaleFactor: max(ScaleSize.textScaleFactor(context), 0.69),
              ),
              const Spacer(),
              const SizedBox(width: 10),
              ElevatedButton(
                  onPressed: () async {
                    final Uri url = Uri.parse('https://tyro.work/resume');
                    if (!await launchUrl(url)) {
                      throw Exception('Could not launch $url');
                    }
                  },
                  child: const Text('Resume')),
              const SizedBox(width: 10),
              ElevatedButton(
                  onPressed: () {
                    setState(() => scrollController.animateTo(
                        scrollController.position.maxScrollExtent,
                        duration: const Duration(milliseconds: 1200),
                        curve: Curves.ease));
                  },
                  child: const Text('Contact')),
              const SizedBox(width: 20),
              SizedBox(
                width: 65,
                height: 50,
                child: FittedBox(
                  fit: BoxFit.fill,
                  child: Column(
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text('Ty',
                              style: TextStyle(
                                  fontFamily: 'Tyrowo Inked',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18)),
                          Switch(
                            value: tyFontOff,
                            onChanged: (bool val) async {
                              widget.updateFont(val);
                              setState(() => tyFontOff = val);
                            },
                          ),
                          const Text('Ø ',
                              // capital Ø, lowercase ø // need a space after to balance out with the ty on the other side
                              style: TextStyle(
                                  fontFamily: 'Ubuntu', fontSize: 18)),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.light_mode_outlined),
                          Switch(
                              value: darkMode,
                              onChanged: (bool val) async {
                                widget.updateLight(val);
                                setState(() => darkMode = val);
                              }),
                          const Icon(Icons.dark_mode_outlined),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
      body: SingleChildScrollView(
        controller: scrollController,
        // to lock this background image in place and have everything scroll past it move the SCSV to the content column and put the tiled image in a fractionally sized box with height and width factor of 1.
        child: Center(
          child: Stack(
            children: [
              Positioned.fill(
                child: Image.asset(
                  'assets/$_background.png',
                  repeat: ImageRepeat.repeat,
                ),
              ),
              Column(
                children: [
                  SizedBox(
                    height: deviceHeight(context) * 0.15,
                  ),
                  Row(
                    children: [
                      SizedBox(width: deviceWidth(context) * 0.10),
                      AnimatedOpacity(
                        opacity: picOpacity ? 1.0 : 0.0,
                        duration: const Duration(milliseconds: 800),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(40.0),
                          child: Container(
                            color: Theme.of(context).cardTheme.color,
                            child: Padding(
                              padding: EdgeInsets.all(
                                max(0.69, deviceWidth(context) / 1080) * 10,
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(40.0),
                                child: Image.asset(
                                  'assets/tyrowo.webp',
                                  width:
                                      max(0.69, deviceWidth(context) / 1080) *
                                          200,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                  SizedBox(height: deviceHeight(context) * 0.05),
                  AnimatedOpacity(
                    opacity: titleOpacity ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 800),
                    child: Row(
                      children: [
                        const Spacer(),
                        Card(
                          child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Row(
                                children: [
                                  Text(
                                    "The ",
                                    style: Theme.of(context)
                                        .textTheme
                                        .displaySmall,
                                    textScaleFactor:
                                        ScaleSize.textScaleFactor(context),
                                  ),
                                  Text(
                                    "Rockstar Developer",
                                    style: Theme.of(context)
                                        .textTheme
                                        .displaySmall!
                                        .copyWith(
                                            color: _colorAnim.value,
                                            shadows: [
                                          const Shadow(
                                            blurRadius: 1.1,
                                            color: Colors.black,
                                          )
                                        ]),
                                    textScaleFactor:
                                        ScaleSize.textScaleFactor(context),
                                  ),
                                  Text(
                                    " you've been searching for.",
                                    style: Theme.of(context)
                                        .textTheme
                                        .displaySmall,
                                    textScaleFactor:
                                        ScaleSize.textScaleFactor(context),
                                  ),
                                ],
                              )),
                        ),
                        SizedBox(width: deviceWidth(context) * 0.05),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: deviceHeight(context) * 0.35,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(40.0),
                    child: Container(
                      color: Theme.of(context).cardTheme.color,
                      width: deviceWidth(context),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(
                                deviceWidth(context) * 0.03,
                                deviceHeight(context) * 0.03,
                                deviceWidth(context) * 0.03,
                                deviceHeight(context) * 0.03),
                            child: Text(
                              'Projects',
                              style: Theme.of(context).textTheme.displayLarge,
                              textScaleFactor:
                                  ScaleSize.textScaleFactor(context),
                            ),
                          ),
                          SizedBox(height: deviceHeight(context) * 0.03),
                          const ProjectBanner(
                              largeBanner: 'assets/equidistant_1080x100.png',
                              smallBanner: 'assets/equidistant_700x50.png',
                              description: EquidistantProjectDescription(),
                              index: 0),
                          SizedBox(height: deviceHeight(context) * 0.03),
                          const ProjectBanner(
                              largeBanner: 'assets/probuster_1080x100.png',
                              smallBanner: 'assets/probuster_700x50.png',
                              description: ProBusterProjectDescription(),
                              index: 0),
                          SizedBox(height: deviceHeight(context) * 0.03),
                          const ProjectBanner(
                              largeBanner: 'assets/web1_1080x100.png',
                              smallBanner: 'assets/web1_700x50.png',
                              description: Web1Description(),
                              index: 0),
                          SizedBox(height: deviceHeight(context) * 0.03),
                          const ProjectBanner(
                              largeBanner: 'assets/web2_1080x100.png',
                              smallBanner: 'assets/web2_700x50.png',
                              description: Web2Description(),
                              index: 0),
                          SizedBox(height: deviceHeight(context) * 0.03),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: deviceHeight(context) * 0.35,
                  ),
                  SizedBox(
                    width: deviceWidth(context) * 0.97,
                    child: Card(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(
                            deviceWidth(context) * 0.03,
                            deviceHeight(context) * 0.03,
                            deviceWidth(context) * 0.03,
                            deviceHeight(context) * 0.03),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Think Pieces',
                              style: Theme.of(context).textTheme.displayLarge,
                              textScaleFactor:
                                  ScaleSize.textScaleFactor(context),
                            ),
                            SizedBox(
                              height: deviceHeight(context) * 0.03,
                            ),
                            Wrap(
                              children: [
                                Padding(
                                  padding: EdgeInsets.fromLTRB(
                                      deviceWidth(context) * 0.015,
                                      deviceHeight(context) * 0.015,
                                      deviceWidth(context) * 0.015,
                                      deviceHeight(context) * 0.015),
                                  child: ThoughtPieces(
                                      previewText: tedhPreview,
                                      article: const TEDHPiece()),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(
                                      deviceWidth(context) * 0.015,
                                      deviceHeight(context) * 0.015,
                                      deviceWidth(context) * 0.015,
                                      deviceHeight(context) * 0.015),
                                  child: ThoughtPieces(
                                      previewText: leetCodePreview,
                                      article: const LeetCodePiece()),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: deviceHeight(context) * 0.35,
                  ),
                  Row(
                    children: [
                      const Spacer(),
                      IconButton.filled(
                          onPressed: () => scrollController.animateTo(0.0,
                              duration: const Duration(milliseconds: 1200),
                              curve: Curves.ease),
                          icon: const Icon(Icons.vertical_align_top)),
                      SizedBox(width: deviceWidth(context) * 0.05),
                    ],
                  ),
                  SizedBox(
                    height: deviceHeight(context) * 0.05,
                  ),
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(40.0), bottom: Radius.zero),
                    child: Container(
                      color: Theme.of(context).primaryColor.withOpacity(0.85),
                      width: deviceWidth(context),
                      height: max(150, deviceHeight(context) * 0.25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Spacer(),
                          Column(
                            children: [
                              SizedBox(
                                  height:
                                      max(35, deviceHeight(context) * 0.075)),
                              Text(
                                'Contact Me',
                                style: Theme.of(context).textTheme.titleLarge,
                                textScaleFactor: max(
                                    ScaleSize.textScaleFactor(context), 0.69),
                              ),
                              SizedBox(height: deviceHeight(context) * 0.02),
                              Text(
                                '984-244-3107',
                                style: Theme.of(context).textTheme.titleMedium,
                                textScaleFactor: max(
                                    ScaleSize.textScaleFactor(context), 0.69),
                              ),
                              TextButton(
                                onPressed: () async {
                                  final Uri url =
                                      Uri.parse('mailto:tylerpcrews@gmail.com');
                                  if (!await launchUrl(url)) {
                                    throw Exception('Could not launch $url');
                                  }
                                },
                                child: Text(
                                  'tylerpcrews@gmail.com',
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                  textScaleFactor: max(
                                      ScaleSize.textScaleFactor(context), 0.69),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: deviceWidth(context) * 0.1),
                          Column(
                            children: [
                              SizedBox(
                                  height:
                                      max(35, deviceHeight(context) * 0.075)),
                              Text(
                                'Socials',
                                style: Theme.of(context).textTheme.titleLarge,
                                textScaleFactor: max(
                                    ScaleSize.textScaleFactor(context), 0.69),
                              ),
                              SizedBox(
                                  height: deviceWidth(context) < 600
                                      ? 0
                                      : deviceHeight(context) * 0.02),
                              deviceWidth(context) < 600
                                  ? Column(
                                      children: [
                                        Row(
                                          children: [
                                            SocialsButton(
                                                image: darkMode
                                                    ? 'assets/socials/github_dark.png'
                                                    : 'assets/socials/github_light.png',
                                                label: 'GitHub',
                                                uri:
                                                    'https://github.com/Tyrowo'),
                                            SocialsButton(
                                                image: darkMode
                                                    ? 'assets/socials/leetcode_dark.png'
                                                    : 'assets/socials/leetcode_light.webp',
                                                label: 'LeetCode',
                                                uri:
                                                    'https://leetcode.com/tyrowo/'),
                                            const SocialsButton(
                                                image:
                                                    'assets/socials/linkedin.png',
                                                label: 'LinkedIn',
                                                uri:
                                                    'https://www.linkedin.com/in/tyrowo/'),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            const SocialsButton(
                                                image:
                                                    'assets/socials/facebook.png',
                                                label: 'Facebook',
                                                uri:
                                                    'https://www.facebook.com/tycrews/'),
                                            const SocialsButton(
                                                image:
                                                    'assets/socials/instagram.png',
                                                label: 'Instagram',
                                                uri:
                                                    'https://www.instagram.com/thundercrews/'),
                                            SocialsButton(
                                                image: darkMode
                                                    ? 'assets/socials/x_dark.png'
                                                    : 'assets/socials/x_light.png',
                                                label: 'X',
                                                uri:
                                                    'https://twitter.com/Tyrowo'),
                                          ],
                                        ),
                                      ],
                                    )
                                  : Row(
                                      children: [
                                        SocialsButton(
                                            image: darkMode
                                                ? 'assets/socials/github_dark.png'
                                                : 'assets/socials/github_light.png',
                                            label: 'GitHub',
                                            uri: 'https://github.com/Tyrowo'),
                                        SocialsButton(
                                            image: darkMode
                                                ? 'assets/socials/leetcode_dark.png'
                                                : 'assets/socials/leetcode_light.webp',
                                            label: 'LeetCode',
                                            uri:
                                                'https://leetcode.com/tyrowo/'),
                                        const SocialsButton(
                                            image:
                                                'assets/socials/linkedin.png',
                                            label: 'LinkedIn',
                                            uri:
                                                'https://www.linkedin.com/in/tyrowo/'),
                                        const SocialsButton(
                                            image:
                                                'assets/socials/facebook.png',
                                            label: 'Facebook',
                                            uri:
                                                'https://www.facebook.com/tycrews/'),
                                        const SocialsButton(
                                            image:
                                                'assets/socials/instagram.png',
                                            label: 'Instagram',
                                            uri:
                                                'https://www.instagram.com/thundercrews/'),
                                        SocialsButton(
                                            image: darkMode
                                                ? 'assets/socials/x_dark.png'
                                                : 'assets/socials/x_light.png',
                                            label: 'X',
                                            uri: 'https://twitter.com/Tyrowo'),
                                      ],
                                    ),
                            ],
                          ),
                          const Spacer(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      /*
      // we don't need a floating action button for this page
      floatingActionButton: FloatingActionButton(
        onPressed: _randomizeBackground,
        tooltip: 'Randomize Background',
        child: const Icon(Icons.add),
      ),
      */
    );
  }
}
