import 'package:flutter/material.dart';
import 'package:netflix_clone/utils/lootie_animation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(child: LottieAnimation()),
      ),
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Color.fromARGB(255, 25, 25, 25),
        appBarTheme: AppBarTheme(
          color: Colors.transparent,
        ),
      ),
    );
  }
}
