import 'package:farego/widget/title_subtitle_cell.dart';
import 'package:farego/widget/today_summary_row.dart';
import 'package:farego/widget/weekly_summary_row.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class SummaryScreen extends StatefulWidget {
  const SummaryScreen({super.key});

  @override
  State<SummaryScreen> createState() => _SummaryScreenState();
}

class _SummaryScreenState extends State<SummaryScreen>
    with SingleTickerProviderStateMixin {
  late TabController _controller; // Changed from nullable to late
  int touchedIndex = -1;

  List todayTripArr = [
    {
      "time": "8:15",
      "am_pm": "AM",
      "name": "Central Park",
      "detail": "Paid by card",
      "price": "\$12"
    },
    {
      "time": "9:30",
      "am_pm": "AM",
      "name": "Grand Station",
      "detail": "Paid in cash",
      "price": "\$18"
    },
    {
      "time": "10:45",
      "am_pm": "AM",
      "name": "Downtown Plaza",
      "detail": "Paid by card",
      "price": "\$22"
    },
    {
      "time": "11:50",
      "am_pm": "AM",
      "name": "City Mall",
      "detail": "Paid in cash",
      "price": "\$30"
    },
    {
      "time": "1:10",
      "am_pm": "PM",
      "name": "Airport Terminal 1",
      "detail": "Paid by card",
      "price": "\$45"
    },
    {
      "time": "2:25",
      "am_pm": "PM",
      "name": "University Campus",
      "detail": "Paid in cash",
      "price": "\$15"
    },
    {
      "time": "3:32",
      "am_pm": "PM",
      "name": "Pembroke Dock",
      "detail": "Paid by card",
      "price": "\$25"
    },
    {
      "time": "4:40",
      "am_pm": "PM",
      "name": "Train Station",
      "detail": "Paid by card",
      "price": "\$28"
    },
    {
      "time": "5:55",
      "am_pm": "PM",
      "name": "Library Avenue",
      "detail": "Paid in cash",
      "price": "\$10"
    },
    {
      "time": "6:20",
      "am_pm": "PM",
      "name": "Tech Park",
      "detail": "Paid by card",
      "price": "\$35"
    },
    {
      "time": "7:45",
      "am_pm": "PM",
      "name": "West End Market",
      "detail": "Paid in cash",
      "price": "\$20"
    },
    {
      "time": "9:15",
      "am_pm": "PM",
      "name": "Nightclub Avenue",
      "detail": "Paid by card",
      "price": "\$50"
    },
  ];

  List weekTripArr = [
    {
      "time": "Mon, 28 Sep",
      "trips": "25",
      "detail": "Paid by card",
      "price": "\$12"
    },
    {
      "time": "Tue, 29 Sep",
      "trips": "30",
      "detail": "Paid by card",
      "price": "\$15"
    },
    {
      "time": "Wed, 30 Sep",
      "trips": "28",
      "detail": "Paid by card",
      "price": "\$14"
    },
    {
      "time": "Thu, 1 Oct",
      "trips": "35",
      "detail": "Paid by card",
      "price": "\$18"
    },
    {
      "time": "Fri, 2 Oct",
      "trips": "22",
      "detail": "Paid by card",
      "price": "\$11"
    },
    {
      "time": "Sat, 3 Oct",
      "trips": "40",
      "detail": "Paid by card",
      "price": "\$20"
    },
    {
      "time": "Sun, 4 Oct",
      "trips": "18",
      "detail": "Paid by card",
      "price": "\$9"
    },
    {
      "time": "Mon, 5 Oct",
      "trips": "25",
      "detail": "Paid by card",
      "price": "\$12"
    },
    {
      "time": "Tue, 6 Oct",
      "trips": "32",
      "detail": "Paid by card",
      "price": "\$16"
    },
    {
      "time": "Wed, 7 Oct",
      "trips": "27",
      "detail": "Paid by card",
      "price": "\$13"
    },
    {
      "time": "Thu, 8 Oct",
      "trips": "29",
      "detail": "Paid by card",
      "price": "\$14.50"
    },
    {
      "time": "Fri, 9 Oct",
      "trips": "26",
      "detail": "Paid by card",
      "price": "\$13"
    },
    {
      "time": "Sat, 10 Oct",
      "trips": "38",
      "detail": "Paid by card",
      "price": "\$19"
    }
  ];


  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Summery',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 8),
          TabBar(
            controller: _controller,
            indicatorColor: Colors.green,
            indicatorPadding: const EdgeInsets.symmetric(horizontal: 20),
            labelColor: Colors.green,
            unselectedLabelColor: Colors.black,
            labelStyle:
                const TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
            unselectedLabelStyle:
                const TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
            tabs: const [Tab(text: "TODAY"), Tab(text: "WEEKLY")],
          ),
          Container(
            width: double.infinity,
            height: 0.5,
            color: Colors.black26,
          ),
          Expanded(
            child: TabBarView(
              controller: _controller,
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 30),
                      const Text(
                        "Mon, 20 Sep '24",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                            fontWeight: FontWeight.w800),
                      ),
                      const SizedBox(height: 8),
                      const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "\$",
                            style: TextStyle(
                                color: Colors.green,
                                fontSize: 16,
                                fontWeight: FontWeight.w800),
                          ),
                          SizedBox(width: 4),
                          Text(
                            "140.09",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w800),
                          ),
                        ],
                      ),
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
                              title: "trips",
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
                              title: "hrs",
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
                              title: "cash_trip",
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
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: double.infinity,
                        height: 50,
                        color: Colors.black12,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "TRIPS",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w800,
                              fontSize: 15),
                        ),
                      ),
                      ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          itemBuilder: (context, index) {
                            var sObj = todayTripArr[index] as Map? ?? {};
                            return TodaySummaryRow(sObj: sObj);
                          },
                          separatorBuilder: (context, index) => Divider(),
                          itemCount: todayTripArr.length)
                    ],
                  ),
                ),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 30),
                      const Text(
                        "Week Earnings Summary",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                            fontWeight: FontWeight.w800),
                      ),
                      const SizedBox(height: 8),
                      const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "\$",
                            style: TextStyle(
                                color: Colors.green,
                                fontSize: 16,
                                fontWeight: FontWeight.w800),
                          ),
                          SizedBox(width: 4),
                          Text(
                            "560.45",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w800),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        height: 250,
                        child: BarChart(
                          BarChartData(
                            barGroups: showingGroups(),
                            titlesData: FlTitlesData(
                              leftTitles: const AxisTitles(
                                  sideTitles: SideTitles(showTitles: false)),
                              rightTitles: const AxisTitles(
                                  sideTitles: SideTitles(showTitles: false)),
                              topTitles: const AxisTitles(
                                  sideTitles: SideTitles(showTitles: false)),
                              bottomTitles: AxisTitles(
                                sideTitles: SideTitles(
                                  showTitles: true,
                                  getTitlesWidget: getTitles,
                                  reservedSize: 38,
                                ),
                              ),
                            ),
                            borderData: FlBorderData(show: false),
                            gridData: const FlGridData(show: false),
                          ),
                        ),
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
                              title: "trips",
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
                              title: "hrs",
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
                              title: "cash_trip",
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
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        width: double.infinity,
                        height: 50,
                        color: Colors.black12,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "TRIPS",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w800,
                              fontSize: 15),
                        ),
                      ),
                      ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          itemBuilder: (context, index) {
                            var sObj = weekTripArr[index] as Map? ?? {};
                            return WeeklySummaryRow(sObj: sObj);
                          },
                          separatorBuilder: (context, index) => Divider(),
                          itemCount: weekTripArr.length)
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget getTitles(double value, TitleMeta meta) {
    var style = const TextStyle(
        color: Colors.green, fontSize: 18, fontWeight: FontWeight.bold);
    List<String> days = ["S", "M", "T", "W", "T", "F", "S"];

    if (value.toInt() < 0 || value.toInt() >= days.length) {
      return const SizedBox();
    }

    return Text(days[value.toInt()], style: style);
  }

  List<BarChartGroupData> showingGroups() {
    List<double> values = [5.0, 10.5, 5.0, 7.5, 15.0, 5.5, 8.5];

    return List.generate(7, (i) {
      print("Creating bar data for index $i with value ${values[i]}");
      return makeGroupData(i, values[i], Colors.green.shade600,
          isTouched: i == touchedIndex);
    });
  }

  BarChartGroupData makeGroupData(int x, double y, Color barColor,
      {bool isTouched = false, double width = 40}) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: isTouched ? y + 1 : y,
          color: barColor,
          width: width,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(5), topRight: Radius.circular(5)),
        ),
      ],
    );
  }
}
