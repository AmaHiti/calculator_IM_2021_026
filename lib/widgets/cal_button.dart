import 'package:calculator_ama/provider/cal_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constant/colors.dart';

class CalculateButton extends StatelessWidget {
  const CalculateButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>
          Provider.of<CalculatorProvider>(context, listen: false).setValue("="),
      child: Material(
        elevation: 12, // Adds elevation
        shadowColor: Colors.black.withOpacity(0.3), // Shadow color
        borderRadius: BorderRadius.circular(40), // Rounded corners for Material
        child: Container(
          height: 160,
          width: 70,
          decoration: BoxDecoration(
            color: AppColors.secondaryColor,
            borderRadius: BorderRadius.circular(40),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.4),
                spreadRadius: 2,
                blurRadius: 8,
                offset: Offset(0, 4), // Shadow position
              ),
            ],
          ),
          child: const Center(
            child: Text(
              "=",
              style: TextStyle(
                fontSize: 32,
                color: Colors.white, // Text color
              ),
            ),
          ),
        ),
      ),
    );
  }
}
