import 'dart:html';

import 'package:chat_gpt_dashboard/factory.dart';
import 'package:chat_gpt_dashboard/theme_data.dart';
import 'package:flutter/material.dart';

void main() {
  // window.document.onContextMenu.listen((evt) => evt.preventDefault());
  AppFactory().init();
  CustomThemeData().init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat GPT history search',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(color: CustomThemeData().theme.darkAccent),
        primaryColor: Colors.yellow,
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF19c37d)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Chat GPT history search'),
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

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
          widget.title,
          style: TextStyle(color: CustomThemeData().theme.mainGreen),
        ),
      ),
      body: Center(), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
