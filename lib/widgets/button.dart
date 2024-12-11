import 'package:calculator_ama/constant/colors.dart';
import 'package:calculator_ama/provider/cal_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Button1 extends StatefulWidget {
  const Button1({
    super.key, 
    required this.label, 
    this.textColor = Colors.white, 
    this.decoration, // New parameter for decoration
  });

  final String label;
  final Color textColor;
  final BoxDecoration? decoration; // Optional decoration parameter

  @override
  _Button1State createState() => _Button1State();
}

class _Button1State extends State<Button1> {
  double _scale = 1.0; // Initial scale value

  // Method to handle button press and scale animation
  void _onTapDown(TapDownDetails details) {
    setState(() {
      _scale = 0.9; // Scale down on press
    });
  }

  void _onTapUp(TapUpDetails details) {
    setState(() {
      _scale = 1.0; // Scale back to original size after release
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Provider.of<CalculatorProvider>(context, listen: false)
          .setValue(widget.label),
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      child: AnimatedScale(
        scale: _scale, // Apply the scale animation
        duration: const Duration(milliseconds: 100), // Duration of the animation
        curve: Curves.easeInOut, // Animation curve for smooth scaling
        child: Material(
          elevation: 10,
          color: AppColors.secondary2Color,
          borderRadius: BorderRadius.circular(50),
          child: Container(
            decoration: widget.decoration ?? BoxDecoration(), // Apply decoration 
            child: CircleAvatar(
              radius: 36,
              backgroundColor: AppColors.secondary2Color,
              child: Text(
                widget.label,
                style: TextStyle(color: widget.textColor, fontSize: 32, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
