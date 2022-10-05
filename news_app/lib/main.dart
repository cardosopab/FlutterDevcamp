import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:news_app/pages/home.dart';

Future<void> main() async {
  await dotenv.load(fileName: "dotEnv");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.purpleAccent,
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.purpleAccent,
        ),
        inputDecorationTheme: const InputDecorationTheme(
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.purpleAccent,
            ),
          ),
          focusColor: Colors.purpleAccent,
        ),
      ),
      home: const HomePage(),
    );
  }
}
