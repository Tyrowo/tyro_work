import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tyro_work/helper/themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tyro Work',
      theme: lightTheme,
      home: const MyHomePage(title: 'Tyro Work'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _background = 4;

  void _randomizeBackground() {
    setState(() {
      _background = Random().nextInt(5) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 0.0),
            child: Image.asset('assets/ty48.png'),
          ),
          title: Row(
            children: [
              const Text('TyRowo',
                  style: TextStyle(
                      fontFamily: 'Tyrowo Inked', fontWeight: FontWeight.w600)),
              const Spacer(),
              ElevatedButton(onPressed: () {}, child: const Text('Resume')),
              const SizedBox(width: 20),
              ElevatedButton(onPressed: () {}, child: const Text('Contact')),
              const SizedBox(width: 20),
              const Text('Ty',
                  style: TextStyle(
                      fontFamily: 'Tyrowo Inked',
                      fontWeight: FontWeight.w600,
                      fontSize: 18)),
              const Switch(
                value: false,
                onChanged: null,
              ),
              const Text('Ø', // capital Ø, lowercase ø
                  style: TextStyle(fontFamily: 'Ubuntu', fontSize: 18)),
              const SizedBox(width: 20),
              const Icon(Icons.light_mode_outlined),
              const Switch(value: false, onChanged: null),
              const Icon(Icons.dark_mode_outlined),
              const SizedBox(width: 10),
            ],
          )),
      body: Center(
        child: Stack(
          children: [
            FractionallySizedBox(
              widthFactor: 1.0,
              heightFactor: 1.0,
              child: Positioned.fill(
                child: Image.asset(
                  'assets/$_background.png',
                  repeat: ImageRepeat.repeat,
                ),
              ),
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
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _randomizeBackground,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
