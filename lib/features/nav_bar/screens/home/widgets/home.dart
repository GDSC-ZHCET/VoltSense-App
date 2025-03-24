// ignore_for_file: deprecated_member_use

/*import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:voltsense2/data/devices/device_controller/device_controller.dart';
import 'package:voltsense2/features/nav_bar/screens/home/widgets/card.dart';
import 'package:voltsense2/features/personalization/controller/user_controller.dart';
//import 'package:iconsax/iconsax.dart';
//import 'package:voltsense2/common/styles/spacing_styles.dart';
//import 'package:voltsense2/common/widgets/custom_shapes/curved_edges/curved_edges.dart';
import 'package:voltsense2/utils/constants/colors.dart';
//import 'package:voltsense2/utils/helpers/helper_functions.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    final deviceController = Get.put(DeviceController());

    return Scaffold(
        appBar: AppBar(
          backgroundColor: VColors.primaryColor,
          automaticallyImplyLeading: false,
          toolbarHeight: 5,
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            Container(
              color: VColors.primaryColor,
              padding: const EdgeInsets.all(20),
              child: SizedBox(
                //height: VHelperFunctions
                //    .screenHeight(), //1000, //VHelperFunctions.screenHeight(),
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Row(
                            children: [
                              Text('Welcome ',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineLarge
                                      ?.copyWith(
                                        fontFamily: 'Lato',
                                        fontWeight: FontWeight.w500, // SemiBold
                                        color: Colors.white,
                                      )),
                              Obx(
                                () => Text(
                                  controller.user.value.username,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineLarge
                                      ?.copyWith(
                                        fontFamily: 'Lato',
                                        fontWeight: FontWeight.w500, // SemiBold
                                        color: Colors.white,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
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
                                  color: Colors.white,
                                ),
                          ),
                        ),
                      ],
                    ),

                    /*Container(
                        width: double.infinity,
                        height: 100,
                        margin: const EdgeInsets.only(top: 120),
                        //padding: const EdgeInsets.only(top: 50),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          // ignore: deprecated_member_use
                          color: VColors.textWhite.withOpacity(0.05),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5.0, horizontal: 10.0),
                          child: Text(
                            'Add Devices',
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.apply(color: Colors.white),
                            //TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                      ),*/
                    // Add Button below "Add Devices"
                    /*Positioned(
                          top: 145,
                          left: 10,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 5.0, horizontal: 5),
                            child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    shape: const CircleBorder(),
                                    backgroundColor: Colors.white),
                                //padding: const EdgeInsets.all(16),
                                child: const Icon(Icons.add,
                                    size: 30, color: Colors.black)),
                          )),*/
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Electrical Parameters',
                  maxLines: 1,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.w500, // SemiBold
                        color: VColors.primaryColor,
                      ),
                ),
              ),
            ),
            const SizedBox(height: 2),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Represent information about electrical parameters',
                  maxLines: 1,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400, // SemiBold
                        color: VColors.primaryColor,
                      ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
                padding: const EdgeInsets.all(15),
                child: Obx(() {
                  final device = deviceController.device.value;

                  //Condition for 'off' status to show 0.0
                  final voltage = device.status == 'off' ? 0.0 : device.voltage;
                  final current = device.status == 'off' ? 0.0 : device.current;
                  final power = device.status == 'off' ? 0.0 : device.power;

                  return GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    shrinkWrap: true,
                    childAspectRatio: 1.2,
                    children: [
                      SensorCard(
                          title: "Voltage",
                          value: voltage.toString(),
                          icon: Icons.bolt,
                          color: Colors.orange),
                      SensorCard(
                          title: "Current",
                          value: current.toString(),
                          icon: Icons.electric_meter,
                          color: Colors.blue),
                      SensorCard(
                          title: "Power",
                          value: power.toString(),
                          icon: Icons.power,
                          color: Colors.green),
                      SensorCard(
                          title: "Frequency",
                          value: "50Hz",
                          icon: Icons.waves,
                          color: Colors.purple),
                    ],
                  );
                }))
          ],
        )));
  }
}*/

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:voltsense2/data/devices/device_controller/device_controller.dart';
import 'package:voltsense2/features/nav_bar/screens/home/widgets/card.dart';
import 'package:voltsense2/features/personalization/controller/user_controller.dart';
import 'package:voltsense2/utils/constants/colors.dart';
import 'package:voltsense2/utils/helpers/helper_functions.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = VHelperFunctions.isDarkMode(context);
    final controller = Get.put(UserController());
    final deviceController = Get.put(DeviceController());

    return Scaffold(
      backgroundColor: dark ? VColors.black : VColors.white,
      appBar: AppBar(
        backgroundColor: VColors.black,
        toolbarHeight: 0,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 100,
              color: dark ? VColors.black : VColors.white,
              padding: const EdgeInsets.only(left: 20, top: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      style:
                          Theme.of(context).textTheme.headlineLarge?.copyWith(
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.w500,
                                color: dark
                                    ? VColors.grey
                                    : VColors.black, //Colors.white,
                              ),
                      children: <TextSpan>[
                        const TextSpan(text: 'Welcome '),
                        TextSpan(
                          text: controller.user.value.username,
                          style: const TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 1),
                  /*Text(
                    'Stay updated with live data on voltage and current from your sensors',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w300,
                          color: Colors.white70,
                        ),
                  ),*/
                ],
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: dark
                      ? VColors.darkGrey.withOpacity(0.7)
                      : VColors.darkGrey.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Iconsax.danger4,
                          color: Colors.red,
                        ),
                        SizedBox(width: 7),
                        Text(
                          'Device Anomaly',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(
                                fontWeight: FontWeight.w500,
                                color: Colors.red,
                              ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    StreamBuilder<Map<String, dynamic>>(
                      stream: Get.find<DeviceController>().deviceAnomaly.stream,
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          print("error found: ${snapshot.error}");
                          return Text('Something went wrong: ${snapshot.error}',
                              style: TextStyle(color: Colors.red));
                        }

                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return CircularProgressIndicator();
                        }

                        if (!snapshot.hasData || snapshot.data!.isEmpty) {
                          return Text('No Data Available');
                        }

                        final anomalyData = snapshot.data!;
                        final latestResponse = anomalyData['ai_explanation'];

                        if (latestResponse != null) {
                          return Text(
                            '$latestResponse',
                            style: TextStyle(
                                color: dark ? VColors.grey : VColors.black),
                          );
                        } else {
                          return Text('No Data Available');
                        }
                      },
                    )
                  ],
                ),
                //const SizedBox(height: 10),
                //TextField(
                //  decoration: InputDecoration(
                //    hintText: 'Type your question...',
                //    border: OutlineInputBorder(
                //      borderRadius: BorderRadius.circular(8),
                //      borderSide: BorderSide(
                //          color: dark ? Colors.black : Colors.black),
                //    ),
                //    focusedBorder: OutlineInputBorder(
                //      borderRadius: BorderRadius.circular(8),
                //      borderSide: BorderSide(color: VColors.black),
                //    ),
                //    suffixIcon: IconButton(
                //      icon: Icon(Icons.send, color: VColors.black),
                //      onPressed: () {
                //        // Gemini API integration.
                //      },
                //    ),
                //  ),
                //),

                //Gemini responses or suggestions
                //Container(
                //  padding: const EdgeInsets.all(12),
                //  decoration: BoxDecoration(
                //    color: dark
                //        ? VColors.grey.withOpacity(0.3)
                //        : Colors.grey[500],
                //    borderRadius: BorderRadius.circular(8),
                //  ),
                //  child: const Text(
                //    'Gemini suggestions will appear here...',
                //    style: TextStyle(fontStyle: FontStyle.italic),
                //  ),
                //),
              ),
            ),
            const SizedBox(height: 30),
            // Placeholder for Device Insights from Firestore
            Padding(
              padding: const EdgeInsets.only(left: 18, right: 18),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: dark ? VColors.black : VColors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 0,
                      blurRadius: 3,
                      offset: const Offset(0, 0),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Iconsax.flash_14,
                          color: dark ? VColors.grey : VColors.black,
                        ),
                        SizedBox(width: 5),
                        Text(
                          'SenseAI',
                          style:
                              Theme.of(context).textTheme.titleLarge?.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: dark ? VColors.grey : VColors.black,
                                  ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Obx(
                      () {
                        final insights =
                            // ignore: invalid_use_of_protected_member
                            deviceController.deviceInsights.value;
                        final latestResponse = insights['response'];
                        //print("insights value: $insights");
                        // ignore: unnecessary_null_comparison
                        if (latestResponse != null) {
                          return Text(
                            '$latestResponse',
                            style: TextStyle(
                                color: dark ? VColors.grey : VColors.black),
                          );
                        } else {
                          return Text('No Data Available');
                        }
                      },
                    ),
                    // Add more UI elements here to display Firestore data
                    // Example:
                    // Text('Average Voltage: ${firestoreData['averageVoltage']}'),
                    // ListView.builder(...) to display a list of alerts
                  ],
                ),
              ),
            ),
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20, bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Electrical Parameters',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.w400,
                          color: dark ? VColors.grey : VColors.black,
                        ),
                  ),
                  //const SizedBox(height: 0),
                  /*Text(
                    'Represent information about electrical parameters',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          color: VColors.primaryColor,
                        ),
                  ),*/
                  const SizedBox(height: 10),
                  StreamBuilder<Map<String, dynamic>>(
                    stream: deviceController.devValues.stream,
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Text('Something went wrong: ${snapshot.error}');
                      }

                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      }

                      if (!snapshot.hasData || snapshot.data == null) {
                        return const Text('No data available.');
                      }
                      // ignore: invalid_use_of_protected_member
                      final device = snapshot.data!;
                      final voltage = device['voltage'];
                      //final current = device.status == false ? 0.0 : device.current;
                      final current = device['current'];
                      final power = device['power'];
                      //final power = device.status == false ? 0.0 : device.power;

                      return GridView.count(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        childAspectRatio: 1.2,
                        children: [
                          SensorCard(
                            title: "Voltage",
                            value: voltage.toStringAsFixed(2),
                            icon: Icons.bolt,
                            color: Colors.orange,
                            backgroundColor: dark
                                ? VColors.grey
                                : VColors.grey, // Theme aware SensorCard
                          ),
                          SensorCard(
                            title: "Current",
                            value: current.toStringAsFixed(2),
                            icon: Icons.electric_meter,
                            color: Colors.blue,
                            backgroundColor: dark
                                ? VColors.grey
                                : VColors.grey, // Theme aware SensorCard
                          ),
                          SensorCard(
                            title: "Power",
                            value: power.toStringAsFixed(2),
                            icon: Icons.power,
                            color: Colors.green,
                            backgroundColor: dark
                                ? VColors.grey
                                : VColors.grey, // Theme aware SensorCard
                          ),
                          SensorCard(
                            title: "Total Power",
                            value:
                                '${deviceController.totalPower.value.toStringAsFixed(2)} kWh',
                            icon: Icons.power_input_outlined,
                            color: Colors.purple,
                            backgroundColor: dark
                                ? VColors.grey
                                : VColors.grey, // Theme aware SensorCard
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
