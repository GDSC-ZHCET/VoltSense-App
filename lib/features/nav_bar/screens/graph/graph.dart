import 'package:flutter/material.dart';
//import 'package:fl_chart/fl_chart.dart';
//import 'package:voltsense2/common/styles/spacing_styles.dart';
//import 'package:voltsense2/features/nav_bar/screens/home/widgets/home.dart';
import 'package:voltsense2/utils/constants/colors.dart';
//import 'package:voltsense2/utils/constants/sizes.dart';

/*class Titles {
  static getTitleData() => FlTitlesData(
      show: true,
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          reservedSize: 22,
          getTitlesWidget: (value, meta) {
            return Text(
              value.toInt().toString(),
              style: const TextStyle(
                color: VColors.primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            );
          },
        ),
      ),
      leftTitles: AxisTitles(
        sideTitles: SideTitles(
          getTitlesWidget: (value, meta) {
            return Text(
              value.toInt().toString(),
              style: const TextStyle(
                color: VColors.primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
            );
          },
          reservedSize: 28,
        ),
      ));
}
*/
class GraphScreen extends StatelessWidget {
  const GraphScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 20,
        backgroundColor: VColors.primaryColor,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: VColors.white,
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Power Consumption Log',
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge
                                ?.copyWith(
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.w600, // SemiBold
                                  color: VColors.primaryColor,
                                ),
                          ),
                        ),
                        SizedBox(height: 5),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Stay updated with live data on voltage and current from your sensors',
                            maxLines: 2,
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w300, // SemiBold
                                  color: VColors.primaryColor,
                                ),
                          ),
                        ),
                        /* Padding(
                          padding: const EdgeInsets.all(20),
                          child: LineGraph(),
                        )*/
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
/*
class LineGraph extends StatelessWidget {
  static const List<Color> gradiantColors = [
    Colors.redAccent,
    Colors.orangeAccent,
  ];
  //const LineGraph({super.key});

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        titlesData: Titles.getTitleData(),
        // Add other required named arguments here
        minX: 0,
        maxX: 11,
        minY: 0,
        maxY: 7000,
        //titlesData: Titles.getTitleData(),
        gridData: FlGridData(
          show: true,
          getDrawingHorizontalLine: (value) {
            return FlLine(
              color: const Color(0xff37434d),
              strokeWidth: 1,
            );
          },
        ),
        borderData: FlBorderData(
          show: true,
          border: Border.all(color: Colors.grey, width: 2),
        ),
        lineBarsData: [
          LineChartBarData(
            spots: [
              FlSpot(0, 3000),
              FlSpot(2.5, 10000),
              FlSpot(4, 5000),
              FlSpot(6, 43000),
              FlSpot(8, 40000),
              FlSpot(9, 30000),
              FlSpot(11, 38000),
            ],
            isCurved: true,
            gradient: LinearGradient(colors: gradiantColors),
            barWidth: 5,
            belowBarData: BarAreaData(
              show: true,
              // ignore: deprecated_member_use
              gradient: LinearGradient(
                  colors: gradiantColors
                      // ignore: deprecated_member_use
                      .map((color) => color.withOpacity(0.3))
                      .toList()),
            ),
          )
        ],
      ),
    );
  }
}*/
