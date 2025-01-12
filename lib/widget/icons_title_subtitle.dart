import 'package:farego/commen/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IconsTitleSubtitle extends StatelessWidget {
  final String title;
  final String subtitle;
  final String icon;
  final VoidCallback onPressed;

  const IconsTitleSubtitle({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(2), // Add padding
        decoration: BoxDecoration(
          color: Colors.white, // Background color
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center, // Center-align content
          children: [
            Image.asset(icon, width: 20, height: 20), // Increased icon size
            const SizedBox(height: 12), // Increased spacing
            Text(
              title,
              style: TextStyle(
                color: AppColors.accentColor,
                fontWeight: FontWeight.w800,
                fontSize: 20, // Slightly larger font
              ),
            ),
            const SizedBox(height: 6), // Added spacing
            Text(
              subtitle,
              style: TextStyle(color: Colors.grey[600], fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
