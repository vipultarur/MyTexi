import 'package:flutter/material.dart';

class BlackRoundButton extends StatelessWidget {
  final String title;
  final Color color;
  final Color backgroundColor;
  final VoidCallback onPressed;

  const BlackRoundButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.color = Colors.white,
    this.backgroundColor = Colors.black, // Default value provided
  });


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: ElevatedButton(
        onPressed: onPressed, // Use the passed onPressed callback here
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          padding: const EdgeInsets.symmetric(vertical: 16),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ),
      ),
    );
  }
}
