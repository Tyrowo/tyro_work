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
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tyro Work',
      theme: darkMode ? darkTheme(tyFontOff) : lightTheme(tyFontOff),
      home: Homescreen(updateLight: _updateLight, updateFont: _updateFont),
    );
  }
}
