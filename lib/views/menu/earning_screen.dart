import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:farego/widget/price_list_view.dart'; // Ensure this file exists

class EarningScreen extends StatefulWidget {
  const EarningScreen({super.key});

  @override
  State<EarningScreen> createState() => _EarningScreenState();
}

class _EarningScreenState extends State<EarningScreen>
    with SingleTickerProviderStateMixin {
  late TabController _controller; // Changed from nullable to late
  int touchedIndex = -1;

  final Map<String, String> todayObj = {
    "trips": "15",
    "hrs": "8:30",
    "cash_trip": "\$22.87",
    "trip_fares": "\$22.87",
    "fee": "\$20.00",
    "tax": "\$20.00",
    "tolls": "\$20.00",
    "surge": "\$20.00",
    "discount": "\$20.00",
    "total": "\$20.00",
  };

  final Map<String, String> weekObj = {
    "trips": "15",
    "hrs": "8:30",
    "cash_trip": "\$22.87",
    "trip_fares": "\$22.87",
    "fee": "\$20.00",
    "tax": "\$20.00",
    "tolls": "\$20.00",
    "surge": "\$20.00",
    "discount": "\$20.00",
    "total": "\$20.00",
  };

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
          'Earning',
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
                      PriceListView(dObj: todayObj),
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
                      PriceListView(dObj: weekObj),
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
          borderRadius: BorderRadius.only(topLeft: Radius.circular(5), topRight: Radius.circular(5)),
        ),
      ],
    );
  }
}
