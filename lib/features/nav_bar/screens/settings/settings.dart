import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:voltsense2/data/repositories.authentication/user/user_repository.dart';
//import 'package:get_storage/get_storage.dart';
import 'package:voltsense2/features/authentication/screens/login/login.dart';
import 'package:voltsense2/features/nav_bar/screens/home/widgets/home.dart';
import 'package:voltsense2/features/nav_bar/screens/settings/widgets/edit_dialog.dart';
import 'package:voltsense2/features/nav_bar/screens/settings/widgets/logout.dart';
import 'package:voltsense2/features/nav_bar/screens/settings/widgets/profile_info.dart';
import 'package:voltsense2/features/personalization/controller/user_controller.dart';
import 'package:voltsense2/utils/constants/colors.dart';
import 'package:voltsense2/utils/constants/sizes.dart';
import 'package:voltsense2/utils/helpers/helper_functions.dart';
//import 'package:voltsense2/utils/constants/colors.dart';
//import 'package:voltsense2/utils/constants/sizes.dart';

/*class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
      children: [
        Stack(
          ///---header
          children: [
            Container(
              width: double.infinity,
              height: 1000,
              color: VColors.primaryColor,
              child: Padding(
                padding: const EdgeInsets.only(top: 20, left: 15),
                child: Text("Account",
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge
                        ?.apply(color: VColors.white)),
              ),
            ),
            SizedBox(height: VSizes.spaceBtwSections),
          ],
        )

        ///---Boody
      ],
    )));
  }
}*/

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  //static UserRepository get instance => Get.put(UserRepository());
  //final conroller = Get.find();

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String name = 'Your name';
  String email = 'your email';
  String phone = 'your phone';

  @override
  Widget build(BuildContext context) {
    final dark = VHelperFunctions.isDarkMode(context);
    final controller = UserController.instance;
    //final updateController = Get.put(UpdateNameController());
    return Scaffold(
      backgroundColor: dark ? VColors.black : VColors.white,
      appBar: AppBar(
        backgroundColor: dark ? VColors.black : VColors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          iconSize: 35,
          color: dark ? VColors.grey : VColors.black,
          onPressed: () {
            if (Navigator.canPop(context)) {
              Navigator.pop(context); // Go back if possible
            } else {
              // If no previous screen, go to the home screen
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
            }
          },
        ),
        title: Text(
          'Profile',
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                fontFamily: 'Lato',
                fontWeight: FontWeight.w500, // SemiBold
                color: dark ? VColors.grey : VColors.black,
              ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
          child: Column(
            children: [
              /*SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                ),
              ),*/
              const SizedBox(
                height: VSizes.spaceBtwSections,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'User Account',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500, // SemiBold
                        color: dark ? VColors.grey : VColors.black,
                      ), //TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              const SizedBox(height: VSizes.defaultSpace),
              Obx(
                () => Container(
                  width: double.infinity,
                  height: 50,
                  //margin: const EdgeInsets.only(top: 1),
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    // ignore: deprecated_member_use
                    color: dark
                        ? VColors.grey.withOpacity(0.05)
                        : VColors.grey.withOpacity(0.5),
                  ),
                  child: profinfo(
                      preicon: Icons.person,
                      title: 'Name',
                      value: controller.user.value.username,
                      onPressed: () {
                        showEditDialog(
                            context: context,
                            fieldLabel: 'Username',
                            titleValue: 'Edit Name',
                            currentValue: controller.user.value.username,
                            onSave: (newVal) async {
                              await UserRepository.instance
                                  .updateSingleField({'username': newVal});
                              final updateUser = await UserRepository.instance
                                  .fetchUserDetails();
                              controller.user.value = updateUser;
                              controller.update();
                            });
                      }),
                ),
              ),
              const SizedBox(height: VSizes.spaceBtwItems),
              Container(
                width: double.infinity,
                height: 50,
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  // ignore: deprecated_member_use
                  color: dark
                      ? VColors.grey.withOpacity(0.05)
                      : VColors.grey.withOpacity(0.5),
                ),
                child: profinfo(
                    preicon: Icons.mail,
                    title: 'E-mail',
                    value: controller.user.value.email,
                    onPressed: () {
                      showEditDialog(
                        context: context,
                        fieldLabel: 'Email',
                        titleValue: 'Edit Email',
                        currentValue: controller.user.value.email,
                        onSave: (newVal) async {
                          //print(controller.user.value.phoneNumber);
                          await UserRepository.instance
                              .updateSingleField({'email': newVal});
                          final updatedUser =
                              await UserRepository.instance.fetchUserDetails();
                          controller.user.value = updatedUser;
                          controller.update();
                        },
                      );
                    }),
              ),
              const SizedBox(height: VSizes.spaceBtwItems),
              Obx(
                () => Container(
                  width: double.infinity,
                  height: 50,
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    // ignore: deprecated_member_use
                    color: dark
                        ? VColors.grey.withOpacity(0.05)
                        : VColors.grey.withOpacity(0.5),
                  ),
                  child: profinfo(
                    preicon: Icons.call,
                    title: 'Phone',
                    value: controller.user.value.phoneNumber,
                    onPressed: () {
                      showEditDialog(
                        context: context,
                        fieldLabel: 'Phone',
                        titleValue: 'Edit Phone',
                        currentValue: controller.user.value.phoneNumber,
                        onSave: (newVal) async {
                          //print(controller.user.value.phoneNumber);
                          await UserRepository.instance
                              .updateSingleField({'phonenumber': newVal});
                          final updatedUser =
                              await UserRepository.instance.fetchUserDetails();
                          controller.user.value = updatedUser;
                          controller.update();
                        },
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: VSizes.spaceBtwItems),
              //Add the button at the top
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      showLogOutDialog(
                        context: context,
                        onLogOut: () async {
                          await FirebaseAuth.instance.signOut();
                          Get.offAll(() => LoginScreen());
                        },
                      );
                    },
                    style: ElevatedButton.styleFrom(
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                        backgroundColor:
                            dark ? VColors.buttonDisabled : VColors.black,
                        foregroundColor:
                            dark ? VColors.buttonDisabled : VColors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                          side: BorderSide(color: VColors.black),
                        )),
                    child: Text(
                      'Logout',
                      style: TextStyle(
                          color: dark ? VColors.black : VColors.white),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
