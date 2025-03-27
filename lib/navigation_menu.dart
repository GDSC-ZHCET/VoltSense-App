import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:voltsense2/data/devices/device_controller/device_controller.dart';
import 'package:voltsense2/features/nav_bar/screens/graph/controller/graph_data_controller.dart';
import 'package:voltsense2/features/nav_bar/screens/graph/graph.dart';
import 'package:voltsense2/features/nav_bar/screens/home/widgets/home.dart';
//import 'package:voltsense2/features/nav_bar/screens/settings/profile.dart';
import 'package:voltsense2/features/nav_bar/screens/settings/settings.dart';
import 'package:voltsense2/features/personalization/controller/user_controller.dart';
import 'package:voltsense2/utils/helpers/helper_functions.dart';
import 'package:voltsense2/utils/constants/colors.dart';

/*
  class NavigationMenu extends StatelessWidget //{
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());

    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 80,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) =>
              controller.selectedIndex.value = index,
          destinations: const [
            NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
            NavigationDestination(icon: Icon(Iconsax.graph), label: 'Graph'),
            NavigationDestination(icon: Icon(Iconsax.user), label: 'Profile'),
          ],
        ),
      ),
      body: controller.screens[controller.selectedIndex.value],
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    Container(color: Colors.red),
    Container(color: Colors.yellow),
    Container(color: Colors.green)
  ];
}
*/

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  //bool get isDarkMode => null;

  @override
  Widget build(BuildContext context) {
    final deviceController = Get.put(DeviceController());
    final controller = Get.put(UserController());
    final graphController = Get.put(GraphDataController());
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: TabBarView(children: [
          HomeScreen(),
          GraphScreen(),
          ProfileScreen(),
        ]),
        bottomNavigationBar: Container(
            color: VHelperFunctions.isDarkMode(context)
                ? VColors.black
                : VColors.white,
            //color: Theme.of(context).brightness == Brightness.dark? Colors.blue: Colors.white
            child: const TabBar(
              tabs: [
                Tab(icon: Icon(Iconsax.home), text: 'Home'),
                Tab(icon: Icon(Iconsax.graph), text: 'Graph'),
                Tab(icon: Icon(Iconsax.user), text: 'Profile'),
              ],
              indicatorColor: Colors.grey,
              labelColor: Colors.grey,
              unselectedLabelColor: Colors.black54,
            )),
      ),
    );
  }
}
