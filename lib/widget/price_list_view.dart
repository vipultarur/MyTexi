import 'package:farego/widget/title_subtitle_cell.dart';
import 'package:farego/widget/title_subtitle_row.dart';
import 'package:flutter/material.dart';

class PriceListView extends StatelessWidget {
  final Map dObj;
  const PriceListView({super.key, required this.dObj});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 15,
        ),
        Container(
          width: double.maxFinite,
          height: 0.5,
          color: Colors.black26,
        ),
        Row(
          children: [
            Expanded(
              child: TitleSubtitleCell(
                title: dObj["trips"],
                subtitle: "Trips",
              ),
            ),
            Container(
              height: 80,
              width: 0.5,
              color: Colors.black26,
            ),
            Expanded(
              child: TitleSubtitleCell(
                title: dObj["hrs"],
                subtitle: "Online hrs",
              ),
            ),
            Container(
              height: 80,
              width: 0.5,
              color: Colors.black26,
            ),
            Expanded(
              child: TitleSubtitleCell(
                title: dObj["cash_trip"],
                subtitle: "Cash Trip",
              ),
            )
          ],
        ),
        Container(
          width: double.maxFinite,
          height: 0.5,
          color: Colors.black26,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
          child: Column(
            children: [
              TitleSubtitleRow(
                title: "Trip fares",
                subtitle: dObj["trips"],
                color: Colors.black26,
              ),
              TitleSubtitleRow(
                title: "Fee",
                subtitle: dObj["fee"],
                color: Colors.black26,
              ),
              TitleSubtitleRow(
                title: "+Tax",
                subtitle: dObj["tax"],
                color: Colors.black26,
              ),
              TitleSubtitleRow(
                title: "+Tolls",
                subtitle: dObj["tolls"],
                color: Colors.black26,
              ),
              TitleSubtitleRow(
                title: "Surge",
                subtitle: dObj["surge"],
                color: Colors.black26,
              ),
              TitleSubtitleRow(
                title: "Discount(-)",
                subtitle: dObj["discount"],
                color: Colors.black26,
              ),
              const Divider(),
              TitleSubtitleRow(
                title: "Total Earnings",
                subtitle: dObj["total"],
                color: Colors.green,
                weight: FontWeight.w800,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 8,
        )
      ],
    );
  }
}