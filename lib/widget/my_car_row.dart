import 'package:flutter/material.dart';

class MyCarRow extends StatelessWidget {
  final Map<String, String> cObj;
  final VoidCallback onPressed;

  const MyCarRow({super.key, required this.cObj, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      child: InkWell(
        onTap: onPressed,
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cObj["name"] ?? "Unknown Car",
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                  Text(
                    cObj["no_plat"] ?? "No Plate",
                    style: TextStyle(color: Colors.grey, fontSize: 15),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Image.asset(
              cObj["image"] ?? "assets/images/default.png",
              width: 100,
              height: 50,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}
