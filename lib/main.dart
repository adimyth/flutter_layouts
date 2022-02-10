import 'package:flutter/material.dart';
import 'package:flutter_layouts/theme/shrineTheme.dart';
import 'package:flutter_layouts/pages/mainpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: kShrineTheme,
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Flutter Layout Basics'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // return RowColumnGrid(title: widget.title);
    // return ContainerLayout(title: widget.title);
    // return MainPage();
    return const Scaffold(
      body: MainPage(),
    );
  }
}
