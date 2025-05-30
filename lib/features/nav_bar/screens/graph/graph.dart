import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:voltsense2/features/nav_bar/screens/graph/controller/graph_data_controller.dart';
import 'package:voltsense2/features/nav_bar/screens/graph/graph_widgets/current.dart';
import 'package:voltsense2/features/nav_bar/screens/graph/graph_widgets/power.dart';
import 'package:voltsense2/features/nav_bar/screens/graph/graph_widgets/voltage.dart';
import 'package:voltsense2/utils/constants/colors.dart';
import 'package:voltsense2/utils/helpers/helper_functions.dart';

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

    return DefaultTabController(
      length: 3,
      child: Scaffold(
          backgroundColor: dark ? VColors.black : VColors.white,
          appBar: AppBar(
            title: Padding(
              padding: const EdgeInsets.only(bottom: 30.0, top: 0, left: 10),
              child: Text('Statistics',
                  maxLines: 2,
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.w500,
                        color:
                            dark ? VColors.grey : VColors.black, //Colors.white,
                      )),
            ),
            toolbarHeight: 100,
            //centerTitle: true,
            backgroundColor: Colors.transparent,
            bottom: TabBar(
              indicatorColor: dark ? VColors.white : VColors.black,
              tabs: [
                Tab(
                    child: Text('Voltage',
                        style: TextStyle(
                            color: dark ? VColors.white : VColors.black))),
                Tab(
                    child: Text('Current',
                        style: TextStyle(
                            color: dark ? VColors.white : VColors.black))),
                Tab(
                    child: Text('Power',
                        style: TextStyle(
                            color: dark ? VColors.white : VColors.black))),
              ],
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.only(top: 25.0),
            child: TabBarView(
              children: [
                VoltageGraphWidget(),
                CurrentGraphWidget(),
                PowerGraphWidget(),
              ],
            ),
          )),
    );
  }
}
