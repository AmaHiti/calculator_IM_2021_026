import 'package:calculator_ama/constant/colors.dart';
import 'package:calculator_ama/widgets/button.dart';
import 'package:flutter/material.dart';

List<Widget> buttonList = [
  // Buttons with Soft Rectangle and Shadow
  Button1(
    label: "AC",
    textColor: AppColors.secondaryColor,
    decoration: BoxDecoration(
      color: const Color.fromARGB(255, 0, 0, 0),
      borderRadius: BorderRadius.circular(15),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.2),
          spreadRadius: 2,
          blurRadius: 5,
          offset: Offset(0, 3),
        ),
      ],
    ),
  ),
  Button1(
    label: "÷",
    textColor: AppColors.secondary3Color,
    decoration: BoxDecoration(
      color: const Color.fromARGB(255, 0, 0, 0),
      borderRadius: BorderRadius.circular(15),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.2),
          spreadRadius: 2,
          blurRadius: 5,
          offset: Offset(0, 3),
        ),
      ],
    ),
  ),
  Button1(
    label: "×",
    textColor: AppColors.secondary3Color,
    decoration: BoxDecoration(
      color: const Color.fromARGB(255, 0, 0, 0),
      borderRadius: BorderRadius.circular(15),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.2),
          spreadRadius: 2,
          blurRadius: 5,
          offset: Offset(0, 3),
        ),
      ],
    ),
  ),
  Button1(
    label: "√",
    textColor: AppColors.secondary3Color,
    decoration: BoxDecoration(
      color: const Color.fromARGB(255, 0, 0, 0),
      borderRadius: BorderRadius.circular(15),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.2),
          spreadRadius: 2,
          blurRadius: 5,
          offset: Offset(0, 3),
        ),
      ],
    ),
  ),
  // Regular buttons without decoration
  const Button1(label: "7"),
  const Button1(label: "8"),
  const Button1(label: "9"),
  Button1(
    label: "+",
    textColor: AppColors.secondary3Color,
    decoration: BoxDecoration(
      color: const Color.fromARGB(255, 0, 0, 0),
      borderRadius: BorderRadius.circular(15),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.2),
          spreadRadius: 2,
          blurRadius: 5,
          offset: Offset(0, 3),
        ),
      ],
    ),
  ),
  const Button1(label: "4"),
  const Button1(label: "5"),
  const Button1(label: "6"),
  Button1(
    label: "-",
    textColor: AppColors.secondary3Color,
    decoration: BoxDecoration(
      color: const Color.fromARGB(255, 0, 0, 0),
      borderRadius: BorderRadius.circular(15),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.2),
          spreadRadius: 2,
          blurRadius: 5,
          offset: Offset(0, 3),
        ),
      ],
    ),
  ),
  const Button1(label: "3"),
  const Button1(label: "2"),
  const Button1(label: "1"),
  const Button1(label: "%"),
  const Button1(label: "0"),
  const Button1(label: "."),
];
