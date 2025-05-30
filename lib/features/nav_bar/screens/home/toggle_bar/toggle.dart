import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:voltsense2/utils/constants/colors.dart';
import 'package:voltsense2/utils/helpers/helper_functions.dart';

class ToggleBar extends StatefulWidget {
  final bool initialValue;
  final ValueChanged<bool> onChanged;

  const ToggleBar({
    super.key,
    required this.initialValue,
    required this.onChanged,
  });

  @override
  _ToggleBarState createState() => _ToggleBarState();
}

class _ToggleBarState extends State<ToggleBar> {
  //late bool _isOn;

  @override
  void initState() {
    super.initState();
    //_isOn = widget.initialValue;
  }

  Future<void> toggleSwitch(bool value) async {
    try {
      final docRef = await FirebaseFirestore.instance
          .collection('sensorData')
          .orderBy('timestamp', descending: true)
          .limit(1)
          .get();

      if (docRef.docs.isNotEmpty) {
        final latestDoc = docRef.docs.first;

        await latestDoc.reference.update({
          'status': value,
        });

        widget.onChanged(value);
      }

      //setState(() {
      //  _isOn = value;
      //});
      //widget.onChanged(value);
    } catch (e) {
      print("Error updating device status: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    final dark = VHelperFunctions.isDarkMode(context);

    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      stream: FirebaseFirestore.instance
          .collection('sensorData')
          .orderBy('timestamp', descending: true)
          .limit(1)
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return CircularProgressIndicator();
        }
        final latestDoc = snapshot.data!.docs.first;
        final data = latestDoc.data();
        final bool boolStatus = data['status'] ?? false;

        //return Switch(
        //  value: _isOn,
        //  onChanged: (value) => toggleSwitch(value),
        //)
        //},);

        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Transform.scale(
              scale: 1.0,
              child: Switch(
                value: boolStatus,
                onChanged: (value) {
                  toggleSwitch(value);
                },
                activeColor: dark ? Colors.black : VColors.black,
                activeTrackColor: VColors.textWhite,
                inactiveThumbColor: Colors.grey,
                inactiveTrackColor: Colors.white,
              ),
            ),
          ],
        );
      },
    );
  }
}
