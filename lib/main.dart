import 'package:final_portfolio/view/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyPortfolio());
}

class MyPortfolio extends StatelessWidget {
  const MyPortfolio({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}