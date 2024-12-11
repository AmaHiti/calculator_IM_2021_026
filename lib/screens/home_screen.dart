import 'package:calculator_ama/constant/colors.dart';
import 'package:calculator_ama/provider/cal_provider.dart';
import 'package:calculator_ama/screens/widgets_data.dart';
import 'package:calculator_ama/widgets/cal_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    const padding = EdgeInsets.symmetric(horizontal: 25, vertical: 30);

    return Consumer<CalculatorProvider>(
      builder: (context, provider, _) {
        return Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
  title: const Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Icon(
        Icons.calculate, // This is the calculator icon
        size: 30,         // Set the size of the icon
        color: Color.fromARGB(234, 231, 29, 123), // Icon color
      ),
      SizedBox(width: 10),  // Space between icon and text
      Text(
        "Mathly",
        style: TextStyle(
          fontFamily: 'Source Sans Pro',  // Use the font you selected
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: Color.fromARGB(255, 255, 255, 255),
          letterSpacing: 0.5, // Small space between characters
        ),
      ),
    ],
  ),
  backgroundColor: Colors.black,  // AppBar background color
),


          body: Stack(
            children: [
              Column(
                children: [
                  // Display equation and result
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        // Display the equation (input)
                        Text(
                          provider.equation, 
                          style: const TextStyle(fontSize: 30, color: Color.fromARGB(191, 246, 246, 246)),
                        ),
                        const SizedBox(height: 10),
                        // Display the result (calculated)
                        Text(
                          provider.result, 
                          style: const TextStyle(fontSize: 50, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Container(
                    height: screenHeight * 0.57,
                    width: double.infinity,
                    padding: padding,
                    decoration: const BoxDecoration(
    gradient: LinearGradient(  
      colors: [Color.fromARGB(255, 40, 44, 44), Color.fromARGB(255, 1, 35, 31)],  // Gradient colors
      begin: Alignment.topLeft,  
      end: Alignment.bottomRight,  
    ),
    borderRadius: BorderRadius.vertical(top: Radius.circular(30)),  // Rounded top corners
  ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: List.generate(4, (index) => buttonList[index]),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: List.generate(4, (index) => buttonList[index + 4]),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: List.generate(4, (index) => buttonList[index + 8]),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: List.generate(3, (index) => buttonList[index + 12]),
                                  ),
                                  const SizedBox(height: 20),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: List.generate(3, (index) => buttonList[index + 15]),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 20),
                            const CalculateButton(),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              // Circular Backspace Button
              Positioned(
                top: 180,
                right: 20,
                child: GestureDetector(
                  onTap: () => provider.setValue("⌫"),
                  child: const CircleAvatar(
                    radius: 30,
                    backgroundColor: AppColors.secondaryColor,
                    child: Icon(
                      Icons.backspace,
                      color: Colors.white,
                      size: 28,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
