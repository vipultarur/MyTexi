import 'package:flutter/material.dart';

class AppColors {
  // General Colors
  static const Color primaryColor = Color(0xFF000000); // Black for buttons/text/icons
  static const Color secondaryColor = Color(0xFFFFFFFF); // White for backgrounds/text
  // White for backgrounds/text
  static const Color accentColor = Color(0xFF00B74A); // Green for routes and highlights
  static const Color darkNavy = Color(0xFF0E1724);
  // Map Colors
  static const Color mapLineColor = Color(0xFF00B74A); // Line color for route (green)
  static const Color mapLineColor1 = Color(0xFFBFE9DB); // BFE9DB
  static const Color mapLineColor2 = Color(0xFF7FD3B7); // 7FD3B7
  static const Color mapLineColor3 = Color(0xFF40BE94); // 40BE94
  static const Color mapLineColor4 = Color(0xFFE5F6F0); // E5F6F0

  static const Color mapMarkerColor = Color(0xFF000000); // Marker outline (black)
  static const Color mapBackgroundColor = Color(0xFFE5E5E5); // Light map background

  // Vehicle Categories
  static const Color economyColor = Color(0xFF00B74A); // Economy green border
  static const Color luxuryColor = Color(0xFF000000); // Luxury black border
  static const Color familyColor = Color(0xFF000000); // Family black border

  // Button Colors
  static const Color buttonColor = Color(0xFF000000); // Black button
  static const Color buttonTextColor = Color(0xFFFFFFFF); // White text in buttons

  // Other Colors
  static const Color visaCardColor = Color(0xFF000000); // VISA text/icon color
  static const Color cardBackgroundColor = Color(0xFFF6F6F6); // Card background

  // Divider Colors
  static const Color dividerColor = Color(0xFFDDDDDD); // Light divider color
}
extension AppContext on BuildContext{
  Size get size=>MediaQuery.sizeOf(this);
  double get width=>size.width;
  double get height=>size.height;

  Future push(Widget widget) async{
    return Navigator.push(
      this,
      MaterialPageRoute(builder: (context)=>widget,
      )
    );
  }

  void pop() async{
    return Navigator.pop(this);
  }
}