import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie_app/screens/home_screen.dart';


void main() => runApp(const MainApp());

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const AnnotatedRegion(
        value: SystemUiOverlayStyle.light,
        child: HomeScreen(),
      ),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color.fromRGBO(229, 172, 25, 1.0),
        scaffoldBackgroundColor: const Color.fromRGBO(21, 22, 22, 1.0),
      )
    );
  }
}
