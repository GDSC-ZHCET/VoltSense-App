import 'package:flutter/material.dart';
import 'package:voltsense2/features/nav_bar/screens/home/widgets/card.dart';
//import 'package:iconsax/iconsax.dart';
//import 'package:voltsense2/common/styles/spacing_styles.dart';
//import 'package:voltsense2/common/widgets/custom_shapes/curved_edges/curved_edges.dart';
import 'package:voltsense2/utils/constants/colors.dart';
//import 'package:voltsense2/utils/helpers/helper_functions.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                          child: Text(
                            'Welcome Back,\nUSER',
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
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                shrinkWrap: true,
                childAspectRatio: 1.2,
                children: [
                  SensorCard(
                      title: "Voltage",
                      value: "220V",
                      icon: Icons.bolt,
                      color: Colors.orange),
                  SensorCard(
                      title: "Current",
                      value: "5A",
                      icon: Icons.electric_meter,
                      color: Colors.blue),
                  SensorCard(
                      title: "Power",
                      value: "1100W",
                      icon: Icons.power,
                      color: Colors.green),
                  SensorCard(
                      title: "Frequency",
                      value: "50Hz",
                      icon: Icons.waves,
                      color: Colors.purple),
                ],
              ),
            )
          ],
        )));
  }
}
