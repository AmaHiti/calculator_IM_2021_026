//IM/2021/026

//Importing packages
import 'package:calculator_ama/provider/cal_provider.dart';
import 'package:calculator_ama/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const CalculatorApp());  //app entry point
}

// Main CalculatorApp widget
class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CalculatorProvider(),
      child: MaterialApp(
        theme: ThemeData.dark(), //dark theme
        debugShowCheckedModeBanner: false,
        home: const HomeScreen(), //setting home screen size
      ),
    );
  }
}


