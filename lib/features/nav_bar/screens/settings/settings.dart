import 'package:flutter/material.dart';
import 'package:voltsense2/features/nav_bar/screens/home/widgets/home.dart';
import 'package:voltsense2/features/nav_bar/screens/settings/widgets/edit_dialog.dart';
import 'package:voltsense2/features/nav_bar/screens/settings/widgets/profile_info.dart';
import 'package:voltsense2/utils/constants/colors.dart';
import 'package:voltsense2/utils/constants/sizes.dart';
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

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String name = 'Your name';
  String email = 'your email';
  String phone = 'your phone';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: VColors.primaryColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          iconSize: 35,
          color: Colors.white,
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
                color: Colors.white,
              ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: VColors.white,
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
                          color: VColors.primaryColor,
                        ), //TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                const SizedBox(height: VSizes.defaultSpace),
                Container(
                  width: double.infinity,
                  height: 50,
                  //margin: const EdgeInsets.only(top: 1),
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    // ignore: deprecated_member_use
                    color: VColors.primaryColor.withOpacity(0.05),
                  ),
                  child: profinfo(
                      preicon: Icons.person,
                      title: 'Name',
                      value: name,
                      onPressed: () {
                        showEditDialog(
                            context: context,
                            fieldLabel: 'Name',
                            currentValue: '{new name}',
                            onSave: (newVal) {
                              setState(() {
                                name = newVal;
                              });
                            });
                      }),
                ),
                const SizedBox(height: VSizes.spaceBtwItems),
                Container(
                  width: double.infinity,
                  height: 50,
                  //margin: const EdgeInsets.only(top: 1),
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    // ignore: deprecated_member_use
                    color: VColors.primaryColor.withOpacity(0.05),
                  ),
                  child: profinfo(
                      preicon: Icons.mail,
                      title: 'E-mail',
                      value: 'your email',
                      onPressed: () {
                        showEditDialog(
                            context: context,
                            fieldLabel: 'E-mail',
                            currentValue: email,
                            onSave: (newVal) {
                              setState(() {
                                email = newVal;
                              });
                            });
                      }),
                ),
                const SizedBox(height: VSizes.spaceBtwItems),
                Container(
                  width: double.infinity,
                  height: 50,
                  //margin: const EdgeInsets.only(top: 1),
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    // ignore: deprecated_member_use
                    color: VColors.primaryColor.withOpacity(0.05),
                  ),
                  child: profinfo(
                    preicon: Icons.call,
                    title: 'Phone',
                    value: 'your phone',
                    onPressed: () {
                      showEditDialog(
                        context: context,
                        fieldLabel: 'Phone',
                        currentValue: phone,
                        onSave: (newVal) {
                          setState(() {
                            phone = newVal;
                          });
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
