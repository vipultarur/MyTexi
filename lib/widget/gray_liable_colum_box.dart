import 'package:flutter/material.dart';

class GrayLiableColumBox extends StatelessWidget {
  final Widget icon;
  final String title;
  final Color titlecolor;
  final Color backgroundColor;
  final TextStyle? textStyle;
  final VoidCallback onPressed;
  const GrayLiableColumBox({
    Key? key,
    required this.icon,
    required this.title,
    this.backgroundColor = Colors.black,
    this.textStyle,
    this.titlecolor = Colors.black, required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            IconButton(onPressed: onPressed, icon: icon),
            const SizedBox(height: 4),
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
