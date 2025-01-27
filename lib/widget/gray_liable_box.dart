import 'package:flutter/material.dart';

class GrayLiableBox extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color titlecolor;
  final Color iconColor;
  final Color backgroundColor;
  final TextStyle? textStyle;

  const GrayLiableBox({
    Key? key,
    required this.icon,
    required this.title,
    this.iconColor = Colors.white,
    this.backgroundColor = Colors.black,
    this.textStyle, this.titlecolor=Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      InkWell(
        onTap: (){},
        child:
        Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: iconColor,
            ),
            const SizedBox(width: 4),
            Text(
              title,
              style: textStyle ??
                  TextStyle(
                    color: titlecolor,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
            ),
          ],
        ),
            ),
      );
  }
}
