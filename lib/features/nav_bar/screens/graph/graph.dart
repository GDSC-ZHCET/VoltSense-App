import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:voltsense2/features/nav_bar/screens/graph/controller/graph_data_controller.dart';
import 'package:voltsense2/utils/constants/colors.dart';
import 'package:voltsense2/utils/helpers/helper_functions.dart';
import 'package:intl/intl.dart';

class GraphScreen extends StatefulWidget {
  const GraphScreen({super.key});

  @override
  State<GraphScreen> createState() => _GraphScreenState();
}

class _GraphScreenState extends State<GraphScreen> {
  @override
  Widget build(BuildContext context) {
    final graphController = Get.find<GraphDataController>();
    final dark = VHelperFunctions.isDarkMode(context);
    return Scaffold(
      backgroundColor: dark ? VColors.black : VColors.white,
      appBar: AppBar(
        title: Text('Power Consumption Log',
            maxLines: 2,
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.w600,
                  color: dark ? VColors.grey : VColors.black, //Colors.white,
                )),
        toolbarHeight: 100,
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: StreamBuilder<List<GraphData>>(
        stream: graphController.voltageDataStream,
        builder: (context, snapshot) {
          print("Snapshot status: ${snapshot.connectionState}");
          print("Has error: ${snapshot.hasError}");
          print("Has data: ${snapshot.hasData}");
          print("Data: ${snapshot.data}");

          if (snapshot.connectionState == ConnectionState.waiting) {
            print("Waiting for data...");

            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            print('Stream error: ${snapshot.error}');
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No data available'));
          }
          final data = snapshot.data!.reversed.toList();
          return SingleChildScrollView(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 100, bottom: 20),
              child: Column(
                children: [
                  Container(
                    child: const Text(
                      'Voltage (V)',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    color: dark ? VColors.grey : VColors.grey,
                  ),
                  SizedBox(
                    height: 200,
                    child: SfCartesianChart(
                      primaryXAxis: CategoryAxis(),
                      series: <LineSeries<GraphData, String>>[
                        LineSeries<GraphData, String>(
                          dataSource: data,
                          xValueMapper: (GraphData g, _) {
                            final dateTime =
                                DateTime.fromMillisecondsSinceEpoch(
                                    g.time.toInt());
                            return DateFormat.jm().format(dateTime);
                          },
                          yValueMapper: (GraphData g, _) => g.voltage,
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ));
        },
      ),
    );
  }
}

// class GraphWidget extends StatefulWidget {
//   const GraphWidget({super.key});

//   @override
//   State<GraphWidget> createState() => _GraphWidgetState();
// }

// class _GraphWidgetState extends State<GraphWidget> {
//   @override
//   Widget build(BuildContext context) {
//     final graphController = Get.find<GraphDataController>();
//     final dark = VHelperFunctions.isDarkMode(context);
//     return Scaffold(
//         backgroundColor: dark ? VColors.black : VColors.white,
//         appBar: AppBar(
//           toolbarHeight: 0,
//           backgroundColor: dark ? VColors.black : VColors.white,
//           title: Text(
//             'Power Consumption Log',
//             style: Theme.of(context).textTheme.headlineLarge?.copyWith(
//                   fontFamily: 'Lato',
//                   fontWeight: FontWeight.w600,
//                 ),
//           ),
//           automaticallyImplyLeading: false,
//         ),
//         body: SingleChildScrollView(
//           child: Column(
//             children: [],
//           ),
//         ));
//   }
// }
// class Titles {
//   static getTitleData() => FlTitlesData(
//       show: true,
//       bottomTitles: AxisTitles(
//         sideTitles: SideTitles(
//           showTitles: true,
//           reservedSize: 22,
//           getTitlesWidget: (value, meta) {
//             return Text(
//               value.toInt().toString(),
//               style: const TextStyle(
//                 color: VColors.primaryColor,
//                 fontWeight: FontWeight.bold,
//                 fontSize: 16,
//               ),
//             );
//           },
//         ),
//       ),
//       leftTitles: AxisTitles(
//         sideTitles: SideTitles(
//           getTitlesWidget: (value, meta) {
//             return Text(
//               value.toInt().toString(),
//               style: const TextStyle(
//                 color: VColors.primaryColor,
//                 fontWeight: FontWeight.bold,
//                 fontSize: 13,
//               ),
//             );
//           },
//           reservedSize: 28,
//         ),
//       ));
// }
// class GraphScreen extends StatelessWidget {
//   const GraphScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final graphController = Get.find<GraphDataController>();
//     final dark = VHelperFunctions.isDarkMode(context);

//     return Scaffold(
//       backgroundColor: dark ? VColors.black : VColors.white,
//       appBar: AppBar(
//         toolbarHeight: 0,
//         backgroundColor: dark ? VColors.black : VColors.white,
//         automaticallyImplyLeading: false,
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Container(
//               color: dark ? VColors.black : VColors.white,
//               padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
//               child: SizedBox(
//                 width: double.infinity,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     Column(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         Align(
//                           alignment: Alignment.centerLeft,
//                           child: Text(
//                             'Power Consumption Log',
//                             style: Theme.of(context)
//                                 .textTheme
//                                 .headlineLarge
//                                 ?.copyWith(
//                                   fontFamily: 'Lato',
//                                   fontWeight: FontWeight.w600, // SemiBold
//                                   color: dark ? VColors.grey : VColors.black,
//                                 ),
//                           ),
//                         ),
//                         SizedBox(height: 80),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             SizedBox(
//                 height: 300,
//                 child: Padding(
//                   padding: const EdgeInsets.only(
//                       left: 8.0, right: 20.0, top: 16.0, bottom: 16.0),
//                   child: Column(
//                     children: [
//                       Expanded(child: buildVoltageChart(graphController)),
//                       const SizedBox(height: 10),
//                       Text('Voltage Trend'),
//                     ],
//                   ),
//                 ))
//           ],
//         ),
//       ),
//     );
//   }

//   Widget buildVoltageChart(GraphDataController graphController) {
//     return StreamBuilder<List<TrendData>>(
//         stream: graphController.voltageValueList.stream,
//         builder: (context, snapshot) {
//           try {
//             if (snapshot.hasData) {
//               return LineChart(
//                 LineChartData(
//                     lineBarsData: [
//                       LineChartBarData(
//                         show: true,
//                         //spots: [
//                         //  FlSpot(1, 220),
//                         //  FlSpot(2, 225),
//                         //  FlSpot(3, 230),
//                         //  FlSpot(4, 228),
//                         //  FlSpot(5, 232),
//                         //  FlSpot(6, 235),
//                         //],
//                         spots: snapshot.data!
//                             .map((trendData) =>
//                                 FlSpot(trendData.time, trendData.voltage))
//                             .toList(),
//                         isCurved: true,
//                         barWidth: 3,
//                       ),
//                     ],
//                     titlesData: FlTitlesData(
//                         show: true,
//                         topTitles: AxisTitles(
//                           sideTitles: SideTitles(showTitles: false),
//                         ),
//                         rightTitles: AxisTitles(
//                             sideTitles: SideTitles(showTitles: false)))),
//               );
//             }
//           } catch (e) {
//             print('no data Found');
//           }
//           return const Center(child: CircularProgressIndicator());
//         });
//   }
// }
