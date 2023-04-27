import 'package:_happytone/src/constants/color.dart';
import 'package:_happytone/src/services/theme_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotifiedPage extends StatelessWidget {
  final String label;
  const NotifiedPage(this.label, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            ThemeService().checkdark() ? Colors.grey[600] : Colors.grey[300],
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Icons.arrow_back_ios,
            color: ThemeService().checkdark() ? Colors.white : Colors.grey,
          ),
        ),
        title: Text(
          label.toString().split("|")[0],
          style: const TextStyle(color: Colors.blue),
        ),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(8),
          height: 400,
          width: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: ThemeService().checkdark() ? Colors.white : Colors.grey[400],
          ),
          child: Center(
            child: Text(
              label.toString().split("|")[1],
              style: const TextStyle(color: sBluishClr, fontSize: 25),
            ),
          ),
        ),
      ),
    );
  }
}
