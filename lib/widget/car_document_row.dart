import 'package:flutter/material.dart';

class CarDocumentRow extends StatelessWidget {
  final String title;
  final String date;
  final String status;
  final Color statusColor;
  final VoidCallback onPressed;

  const CarDocumentRow({super.key, required this.title, required this.date, required this.status, required this.statusColor, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: InkWell(
        onTap: onPressed,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(child: Text(title, style: const TextStyle(color: Colors.green, fontSize: 16))),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                  decoration: BoxDecoration(
                    color: statusColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: statusColor, width: 0.5),
                  ),
                  child: Text(status, style: TextStyle(color: statusColor, fontSize: 10, fontWeight: FontWeight.w600)),
                )
              ],
            ),
            const SizedBox(height: 6),
            Text(date, style: const TextStyle(color: Colors.grey, fontSize: 15)),
            const SizedBox(height: 10),
            const Divider(height: 1),
          ],
        ),
      ),
    );
  }
}
