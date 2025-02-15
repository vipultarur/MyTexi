import 'package:flutter/material.dart';

class WeeklySummaryRow extends StatelessWidget {
  final Map sObj;
  const WeeklySummaryRow({super.key, required this.sObj});

  @override
  Widget build(BuildContext context) {
    var price = double.tryParse(sObj["total_amt"].toString()) ?? 0.0;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  sObj["time"]
                      .toString(),
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
                Text(
                "Trips ${ sObj["trips"] }",
                  style: TextStyle(color:  Colors.grey, fontSize: 15),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            sObj["price"],
            style: TextStyle(color:  Colors.grey, fontSize: 16,fontWeight: FontWeight.w800),
          ),
        ],
      ),
    );
  }
}