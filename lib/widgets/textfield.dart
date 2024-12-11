import 'package:calculator_ama/constant/colors.dart';
import 'package:flutter/material.dart';

//a read-only, styled text field widget
class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key, required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
     padding: EdgeInsets.symmetric(horizontal: 25, vertical: 30),
     child: TextField(
       controller: controller,
       decoration: const InputDecoration(
         border: InputBorder.none,
         fillColor: AppColors.primaryColor,
         filled: true,
       ),
       style: TextStyle(fontSize: 50),
       readOnly: true,
       autofocus: true,
       showCursor: true,
     ),
                );
  }
}