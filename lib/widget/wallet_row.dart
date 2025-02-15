import 'package:flutter/material.dart';

class WalletRow extends StatelessWidget {
  final Map<String, String> wObj;
  const WalletRow({super.key, required this.wObj});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Image.asset(
            wObj["icon"]!,
            width: 35,
            height: 35,
            fit: BoxFit.cover,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  wObj["name"]!,
                  style: const TextStyle(color: Colors.black, fontSize: 16),
                ),
                const SizedBox(height: 4),
                Text(
                  wObj["time"]!,
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 14),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Text(
            wObj["price"]!,
            style: const TextStyle(
              color: Colors.green,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
