import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:_happytone/src/constants/color.dart';
import 'package:_happytone/src/constants/sizes.dart';
import 'package:_happytone/src/features/authentication/controllers/profile_controller.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class UserManagement extends StatelessWidget {
  UserManagement({super.key});

  final controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(LineAwesomeIcons.angle_left),
          ),
          title: Text(
            "Users",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(sDefaultSize - 10),
            child: FutureBuilder(
              future: controller.getAllUser(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data!.length,
                        itemBuilder: ((context, index) {
                          return Column(
                            children: [
                              ListTile(
                                iconColor: sPrimaryColor,
                                tileColor: sPrimaryColor.withOpacity(.3),
                                leading: Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color: Colors.yellow.withOpacity(1),
                                  ),
                                  child: const Icon(
                                    LineAwesomeIcons.user_1,
                                    color: Colors.black,
                                  ),
                                ),
                                title: Text(
                                    "Name: ${snapshot.data![index].fullName}"),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(snapshot.data![index].phoneNo),
                                    Text(snapshot.data![index].email),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          );
                        }));
                  } else if (snapshot.hasError) {
                    return Center(child: Text(snapshot.error.toString()));
                  } else {
                    return const Center(child: Text('Login to continue'));
                  }
                } else {
                  return const Center(
                      heightFactor: 17,
                      widthFactor: 15,
                      child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
