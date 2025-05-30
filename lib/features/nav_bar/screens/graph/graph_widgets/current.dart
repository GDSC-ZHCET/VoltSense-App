import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:voltsense2/features/nav_bar/screens/graph/controller/graph_data_controller.dart';
import 'package:voltsense2/utils/constants/colors.dart';
import 'package:voltsense2/utils/helpers/helper_functions.dart';

class CurrentGraphWidget extends StatefulWidget {
  const CurrentGraphWidget({super.key});

  @override
  State<CurrentGraphWidget> createState() => _CurrentGraphWidgetState();
}

class _CurrentGraphWidgetState extends State<CurrentGraphWidget> {
  @override
  Widget build(BuildContext context) {
    final currentDataController = Get.find<GraphDataController>();
    final dark = VHelperFunctions.isDarkMode(context);

    return SingleChildScrollView(
      child: StreamBuilder<List<GraphData>>(
        stream: currentDataController.voltageDataStream,
        builder: (context, snapshot) {
          print("Snapshot status: ${snapshot.connectionState}");
          print("Has error: ${snapshot.hasError}");
          print("Has data: ${snapshot.hasData}");
          print("Data: ${snapshot.data}");

          if (snapshot.connectionState == ConnectionState.waiting) {
            print("waiting for data...");
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            print('Stream error: ${snapshot.error}');
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No Voltage Data Available'));
          }
          final data = snapshot.data!.reversed.toList();
          return Padding(
            padding: const EdgeInsets.all(5.0),
            child: SizedBox(
              height: 500,
              child: SfCartesianChart(
                primaryXAxis: DateTimeAxis(
                  dateFormat: DateFormat.jm(),
                  intervalType: DateTimeIntervalType.seconds,
                  interval: 1,
                  //edgeLabelPlacement: EdgeLabelPlacement.shift,
                  //majorGridLines: const MajorGridLines(width: 1),
                ),
                primaryYAxis: NumericAxis(
                  labelFormat: '{value} A',
                  minimum: 0,
                  interval: 1,
                ),
                series: <LineSeries<GraphData, DateTime>>[
                  LineSeries<GraphData, DateTime>(
                    dataSource: data,
                    xValueMapper: (g, _) =>
                        DateTime.fromMillisecondsSinceEpoch(g.time.toInt()),
                    yValueMapper: (g, _) => g.current,
                    color: dark ? VColors.white : VColors.black,
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
