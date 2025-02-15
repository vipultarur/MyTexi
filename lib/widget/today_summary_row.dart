import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TodaySummaryRow extends StatelessWidget {
  final Map sObj;
  const TodaySummaryRow({super.key, required this.sObj});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Text(
              sObj["time"],
              style: TextStyle(color: Colors.grey,fontSize: 15,fontWeight: FontWeight.w800),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20)
              ),
              child: Text(
                sObj["am_pm"],
                style: TextStyle(color: Colors.grey,fontSize: 15,fontWeight: FontWeight.w800),
              ),
            ),
          ],
        ),
        Expanded(child:
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              sObj["name"],
              style: TextStyle(color: Colors.grey,fontSize: 16,fontWeight: FontWeight.w800),
            ),
            Text(
              sObj["detail"],
              style: TextStyle(color: Colors.grey,fontSize: 15,fontWeight: FontWeight.w800),
            )
          ],
        ),
        ),
        SizedBox(width: 8,),
        Text(
          sObj["price"],
          style: TextStyle(color: Colors.grey,fontSize: 15,fontWeight: FontWeight.w800),
        )
      ],
    );
  }
}
