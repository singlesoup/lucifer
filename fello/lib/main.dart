import 'package:fello/src/features/intro/screens/intro_screen.dart'
    show IntroScreen;
import 'package:flutter/material.dart'
    show BuildContext, MaterialApp, StatelessWidget, ThemeData, Widget, runApp;

void main() {
  runApp(const FelloGamify());
}

class FelloGamify extends StatelessWidget {
  const FelloGamify({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const IntroScreen(),
    );
  }
}
