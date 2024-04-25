import 'package:flutter/material.dart';
import 'package:flutter_note_app/pages/home_page.dart';
import 'package:google_fonts/google_fonts.dart';

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
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          textTheme:
              GoogleFonts.montserratTextTheme(Theme.of(context).textTheme),
          useMaterial3: true,
        ),
        home: const HomePage());
  }
}
