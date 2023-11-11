import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tyro_work/data/article_data.dart';
import 'package:tyro_work/helper/socials_button.dart';
import 'package:tyro_work/helper/themes.dart';
import 'package:tyro_work/helper/thought_pieces.dart';
import 'package:url_launcher/url_launcher.dart';

class Homescreen extends StatefulWidget {
  final ValueChanged<bool> updateFont;
  final ValueChanged<bool> updateLight;
  const Homescreen(
      {super.key, required this.updateFont, required this.updateLight});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  int _background = 4;
  bool tyFontOff = false;
  bool darkMode = false;
  double deviceWidth(BuildContext context) => MediaQuery.of(context).size.width;
  double deviceHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;
  final List<bool> _openProjects = [false, false, false];

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

  @override
  void initState() {
    super.initState();
    checkPrefsFont();
    checkPrefsLight();
    _randomizeBackground();
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
              const Text('TyRowo',
                  style: TextStyle(
                      fontSize: 20.0,
                      fontFamily: 'Tyrowo Inked',
                      fontWeight: FontWeight.w600)),
              const Spacer(),
              const SizedBox(width: 10),
              ElevatedButton(onPressed: () {}, child: const Text('Resume')),
              const SizedBox(width: 10),
              ElevatedButton(onPressed: () {}, child: const Text('Contact')),
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(40.0),
                        child: Image.asset('assets/tyrowo.jpg'),
                      ),
                      SizedBox(width: deviceWidth(context) * 0.5),
                    ],
                  ),
                  SizedBox(height: deviceHeight(context) * 0.05),
                  Row(
                    children: [
                      const Spacer(),
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text(
                              "The Rockstar Developer you've been searching for.",
                              style: Theme.of(context).textTheme.displayMedium),
                        ),
                      ),
                      SizedBox(width: deviceWidth(context) * 0.01),
                    ],
                  ),
                  SizedBox(
                    height: deviceHeight(context) * 0.5,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(40.0),
                    child: Container(
                      color: Theme.of(context).primaryColor,
                      width: deviceWidth(context),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(
                                deviceWidth(context) * 0.03,
                                deviceHeight(context) * 0.03,
                                deviceWidth(context) * 0.03,
                                deviceHeight(context) * 0.03),
                            child: Text('Projects',
                                style:
                                    Theme.of(context).textTheme.displayLarge),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(
                                deviceWidth(context) * 0.04,
                                deviceHeight(context) * 0.01,
                                deviceWidth(context) * 0.04,
                                deviceHeight(context) * 0.01),
                            child: ExpansionPanelList(
                              materialGapSize: deviceHeight(context) * 0.03,
                              animationDuration:
                                  const Duration(milliseconds: 800),
                              // expandIconColor: Colors.white, // can't get this color to change no matter what I do, would like to change it to a ternary for light/dark
                              // projects expansion panel list so that they can expand from the banner to show descriptions of the projects
                              children: [
                                ExpansionPanel(
                                  backgroundColor:
                                      Theme.of(context).primaryColor,
                                  canTapOnHeader: true,
                                  headerBuilder: (context, isOpen) {
                                    return SizedBox(
                                      height: 250,
                                      child: Image.asset(
                                        'assets/equidistant_1080x200.png',
                                        fit: BoxFit.cover,
                                      ),
                                    );
                                  },
                                  body: const Card(
                                      child: SizedBox(
                                          width: 100,
                                          height: 100,
                                          child: Text('hi!'))),
                                  isExpanded: _openProjects[0],
                                ),
                                ExpansionPanel(
                                  backgroundColor:
                                      Theme.of(context).primaryColor,
                                  canTapOnHeader: true,
                                  headerBuilder: (context, isOpen) {
                                    return Container(
                                      decoration: const BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            Color.fromRGBO(251, 80, 201, 1),
                                            Color.fromRGBO(251, 80, 201, 1),
                                            Color.fromRGBO(7, 214, 105, 1),
                                            Color.fromRGBO(7, 214, 105, 1),
                                            Color.fromRGBO(28, 146, 245, 1),
                                            Color.fromRGBO(28, 146, 245, 1),
                                          ],
                                          stops: [
                                            0.1,
                                            0.25,
                                            0.251,
                                            0.75,
                                            0.751,
                                            0.99
                                          ],
                                          transform: GradientRotation(0.9),
                                        ),
                                      ),
                                      height: 250,
                                      child: Center(
                                        child: Text(
                                            'The Procrastination Buster',
                                            style: tyTextTheme(Colors.white)
                                                .displayLarge,
                                            textAlign: TextAlign.center),
                                      ),
                                    );
                                  },
                                  body: const Card(
                                      child: SizedBox(
                                          width: 100,
                                          height: 100,
                                          child: Text('hi!'))),
                                  isExpanded: _openProjects[1],
                                ),
                                ExpansionPanel(
                                  backgroundColor:
                                      Theme.of(context).primaryColor,
                                  canTapOnHeader: true,
                                  headerBuilder: (context, isOpen) {
                                    return SizedBox(
                                      height: 250,
                                      child: Image.asset(
                                        'assets/inked_1080x200.png',
                                        fit: BoxFit.cover,
                                      ),
                                    );
                                  },
                                  body: const Card(
                                      child: SizedBox(
                                          width: 100,
                                          height: 100,
                                          child: Text('hi!'))),
                                  isExpanded: _openProjects[2],
                                ),
                              ],
                              expansionCallback: (i, isOpen) =>
                                  setState(() => _openProjects[i] = isOpen),
                            ),
                          ),
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
                            Text('Think Pieces',
                                style:
                                    Theme.of(context).textTheme.displayLarge),
                            SizedBox(
                              height: deviceHeight(context) * 0.03,
                            ),
                            ThoughtPieces(
                                previewText: tedhPreview, article: tedhArticle)
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: deviceHeight(context) * 0.35,
                  ),
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(40.0), bottom: Radius.zero),
                    child: Container(
                      color: Theme.of(context).primaryColor,
                      width: deviceWidth(context),
                      height: deviceHeight(context) * 0.2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Spacer(),
                          Column(
                            children: [
                              SizedBox(height: deviceHeight(context) * 0.04),
                              Text('Contact Me',
                                  style:
                                      Theme.of(context).textTheme.displaySmall),
                              SizedBox(height: deviceHeight(context) * 0.02),
                              Text('984-244-3107',
                                  style:
                                      Theme.of(context).textTheme.titleMedium),
                              TextButton(
                                  onPressed: () async {
                                    final Uri url = Uri.parse(
                                        'mailto:tylerpcrews@gmail.com');
                                    if (!await launchUrl(url)) {
                                      throw Exception('Could not launch $url');
                                    }
                                  },
                                  child: Text('tylerpcrews@gmail.com',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium)),
                            ],
                          ),
                          SizedBox(width: deviceWidth(context) * 0.1),
                          Column(
                            children: [
                              SizedBox(height: deviceHeight(context) * 0.04),
                              Text('Socials',
                                  style:
                                      Theme.of(context).textTheme.displaySmall),
                              SizedBox(height: deviceHeight(context) * 0.02),
                              Row(
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
                                      uri: 'https://leetcode.com/tyrowo/'),
                                  const SocialsButton(
                                      image: 'assets/socials/linkedin.png',
                                      label: 'LinkedIn',
                                      uri:
                                          'https://www.linkedin.com/in/tyrowo/'),
                                  const SocialsButton(
                                      image: 'assets/socials/facebook.png',
                                      label: 'Facebook',
                                      uri: 'https://www.facebook.com/tycrews/'),
                                  const SocialsButton(
                                      image: 'assets/socials/instagram.png',
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
