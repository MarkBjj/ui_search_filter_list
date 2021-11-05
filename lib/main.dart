import 'package:flutter/material.dart';
import 'package:ui_search_filter_list/screens/home_screen.dart';

//https://www.youtube.com/watch?v=oFZIwBudIj0&ab_channel=JohannesMilke
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Search In ListView & Filter ListView',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        //textTheme: TextTheme()
      ),
      home: const HomeScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center());
  }
}
