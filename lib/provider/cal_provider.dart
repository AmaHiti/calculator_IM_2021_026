import 'package:flutter/material.dart';
import 'package:function_tree/function_tree.dart'; // For mathematical operations
import 'dart:math'; // Importing the dart:math library for sqrt function

class CalculatorProvider extends ChangeNotifier {
  final compController = TextEditingController();
  String equation = ""; // To store the equation for display
  String result = ""; // To store the result of the computation

  // Function to set values when buttons are pressed
  setValue(String value) {
    String str = compController.text;

    switch (value) {
      case "AC": // Clear everything
        compController.clear();
        equation = "";
        result = "";
        break;
      case "√": // Square root logic
        if (str.isNotEmpty && double.tryParse(str) != null) {
          double num = double.parse(str);
          if (num >= 0) {
            double sqrtResult = sqrt(num); // Use sqrt from dart:math
            compController.text = sqrtResult.toString();
            equation = "√$str"; // Update equation with square root symbol
            result = sqrtResult.toString(); // Store result
          } else {
            compController.text = "Error"; // Handle negative number input
            equation = "√$str";
            result = "Error";
          }
        }
        break;
      case "C": // Clear last character
        if (str.isNotEmpty) {
          compController.text = str.substring(0, str.length - 1);
          equation = equation.substring(0, equation.length - 1); // Update equation
        }
        break;
      case "⌫": // Backspace logic
        if (str.isNotEmpty) {
          compController.text = str.substring(0, str.length - 1);
          equation = equation.substring(0, equation.length - 1); // Update equation
        }
        break;
      case "×": // Replace symbol for multiplication
        if (isValidInput(value)) {
          compController.text += "×";
          equation += "×";
        }
        break;
      case "÷": // Replace symbol for division
        if (isValidInput(value)) {
          compController.text += "÷";
          equation += "÷";
        }
        break;
      case "=": // Compute the result
        compute();
        break;
      case ".": // Handle decimal input
        if (canAddDecimal()) {
          compController.text += ".";
          equation += ".";
        }
        break;
      case "%": // Percentage logic
        if (str.isNotEmpty && isValidLastInput()) {
          compController.text += "÷100";
          equation += "÷100";
        }
        break;
      default: // Add digits or operators
        if (isValidInput(value)) {
          compController.text += value;
          equation += value;
        }
    }

    // Update cursor position
    compController.selection = TextSelection.fromPosition(
      TextPosition(offset: compController.text.length),
    );
    notifyListeners();
  }

  // Function to compute the entered expression
  compute() {
    try {
      String text = equation;

      // Replace display operators with interpretable ones for calculation
      String interpretableText = text.replaceAll('×', '*').replaceAll('÷', '/');

      // Check for division by zero and showing error
      if (interpretableText.contains("/0")) {
        result = "Can't divide by zero";
        compController.text = "$equation = $result";
        notifyListeners();
        return;
      }

      if (interpretableText.isNotEmpty) {
        String computedResult = interpretableText.interpret().toString();

        // Store the result, and format the result with the original operators (to make result more user friendly)
        result = computedResult.replaceAll('*', '×').replaceAll('/', '÷');
      }

      // Update the compController to show the full equation and result
      compController.text = "$equation = $result";
    } catch (e) {
      result = "Error"; // Handle invalid operations
      compController.text = "$equation = Error";
    }
    notifyListeners();
  }

  // Validation for multiple consecutive operators (prevents user from entering multiple operators)
  bool isValidInput(String value) {
    // Check if the value is an operator (+, -, ×, ÷)
    if (value == "+" || value == "-" || value == "×" || value == "÷") {
      // Prevent operators at the start of the equation
      if (compController.text.isEmpty) return false;

      String lastChar = compController.text.substring(compController.text.length - 1);

      // Prevent consecutive operators (+, -, ×, ÷)
      if ("+-×÷".contains(lastChar)) return false;
    }
    return true;
  }

  // Validation for adding decimal points
  bool canAddDecimal() {
    String str = compController.text;
    if (str.isEmpty) return true; // Allow if starting with a decimal
    String lastNum = str.split(RegExp(r"[+\-×÷]")).last;
    return !lastNum.contains("."); // Only one decimal point per number
  }

  // Ensure the last input is valid for operations
  bool isValidLastInput() {
    if (compController.text.isEmpty) return false;
    String lastChar = compController.text.substring(compController.text.length - 1);
    return !("+-×÷".contains(lastChar)); // Cannot end with an operator
  }

  @override
  void dispose() {
    super.dispose();
    compController.dispose();
  }
}
