import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
                              "The Rockstar Developer you've been looking for.",
                              style: Theme.of(context).textTheme.displayLarge),
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
                      height: deviceHeight(context),
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
                              expandIconColor:
                                  const Color.fromRGBO(255, 255, 255, 0),
                              // expandedHeaderPadding: const EdgeInsets.all(1.0),
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
                              ],
                              expansionCallback: (i, isOpen) =>
                                  setState(() => _openProjects[i] = isOpen),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: deviceHeight(context),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 80, 0, 40),
                    child: Center(
                      child: Card(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const Text(
                              'You have pushed the button this many times:',
                            ),
                            Text(
                              '$_background',
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                            ElevatedButton(
                              child: const Text('hi'),
                              onPressed: () => print('hi'),
                            ),
                            TextButton(
                              child: const Text('a link'),
                              onPressed: () => print('ok'),
                            ),
                            const Icon(Icons.abc_outlined),
                          ],
                        ),
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
