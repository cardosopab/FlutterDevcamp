import 'package:flutter/material.dart';
import 'package:travel_ui/screens/home.dart';

void main() {
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
        // primarySwatch: Colors.red,
        colorScheme: ColorScheme.dark(primary: Colors.teal.shade600),
      ),
      home: const MyHomePage(),
    );
  }
}
