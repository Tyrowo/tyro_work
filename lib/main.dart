import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tyro_work/helper/themes.dart';
import 'package:tyro_work/screens/homescreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool tyFontOff = false;
  bool darkMode = false;
// store precached background images
  late Image background1;
  late Image background2;
  late Image background3;
  late Image background4;
  late Image background5;
  late Image background6;

  void _updateFont(bool tyOff) async {
    setState(() => tyFontOff = tyOff);
    final localStorage = await SharedPreferences.getInstance();
    localStorage.setBool('tyFontOff', tyOff);
  }

  void _updateLight(bool darkOn) async {
    setState(() => darkMode = darkOn);
    final localStorage = await SharedPreferences.getInstance();
    localStorage.setBool('darkModeOn', darkOn);
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
    background1 = Image.asset('assets/1.jpg', repeat: ImageRepeat.repeat);
    background2 = Image.asset('assets/2.jpg', repeat: ImageRepeat.repeat);
    background3 = Image.asset('assets/3.jpg', repeat: ImageRepeat.repeat);
    background4 = Image.asset('assets/4.jpg', repeat: ImageRepeat.repeat);
    background5 = Image.asset('assets/5.jpg', repeat: ImageRepeat.repeat);
    background6 = Image.asset('assets/6.jpg', repeat: ImageRepeat.repeat);
  }

// add precaching to background images so they load before everything else
  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    await precacheImage(background1.image, context);
    if (mounted) {
      await precacheImage(background2.image, context);
    }
    if (mounted) {
      await precacheImage(background3.image, context);
    }
    if (mounted) {
      await precacheImage(background4.image, context);
    }
    if (mounted) {
      await precacheImage(background5.image, context);
    }
    if (mounted) {
      await precacheImage(background6.image, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Image> backgrounds = [
      background1,
      background2,
      background3,
      background4,
      background5,
      background6
    ];
    return MaterialApp(
      scrollBehavior: AllowDragScroll(),
      debugShowCheckedModeBanner: false,
      title: 'Tyro Work',
      theme: darkMode ? darkTheme(tyFontOff) : lightTheme(tyFontOff),
      home: Homescreen(
          updateLight: _updateLight,
          updateFont: _updateFont,
          backgrounds: backgrounds),
    );
  }
}
