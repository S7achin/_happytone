import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:_happytone/src/constants/color.dart';
import 'package:_happytone/src/constants/image_strings.dart';
import 'package:_happytone/src/constants/sizes.dart';
import 'package:_happytone/src/constants/text_strings.dart';
import 'package:_happytone/src/features/authentication/controllers/profile_controller.dart';
import 'package:_happytone/src/features/authentication/models/database_model/user_model.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class UpdateProfileScreen extends StatelessWidget {
  const UpdateProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(LineAwesomeIcons.angle_left),
        ),
        title: Text(
          sEditProfile,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(sDefaultSize),
          child: FutureBuilder(
            future: controller.getUserData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  UserModel userData = snapshot.data as UserModel;

                  // Controllers
                  final id = userData.id;
                  final email = TextEditingController(text: userData.email);
                  final password =
                      TextEditingController(text: userData.password);
                  final fullName =
                      TextEditingController(text: userData.fullName);
                  final phoneNo = TextEditingController(text: userData.phoneNo);

                  return Column(children: [
                    Stack(
                      children: [
                        SizedBox(
                          width: 120,
                          height: 120,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: const Image(
                                  image: AssetImage(sProfileImage))),
                        ),
                        Positioned(
                          right: 0,
                          bottom: 0,
                          child: Container(
                            width: 35,
                            height: 35,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: sPrimaryColor,
                            ),
                            child: const Icon(
                              LineAwesomeIcons.camera,
                              size: 20,
                              color: Colors.black,
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    // const Divider(),

                    Form(
                      child: Column(children: [
                        TextFormField(
                          controller: fullName,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(
                              Icons.person_outline_outlined,
                            ),
                            label: Text(sFullName),
                          ),
                        ),
                        const SizedBox(
                          height: sFormHeight - 15,
                        ),
                        TextFormField(
                          controller: email,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(
                              Icons.email_outlined,
                            ),
                            label: Text(sEmail),
                          ),
                        ),
                        const SizedBox(
                          height: sFormHeight - 15,
                        ),
                        TextFormField(
                          controller: phoneNo,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(
                              Icons.phone_android_outlined,
                            ),
                            label: Text(sPhoneNo),
                          ),
                        ),
                        const SizedBox(
                          height: sFormHeight - 15,
                        ),
                        TextFormField(
                          controller: password,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(
                              Icons.fingerprint,
                            ),
                            label: Text(sPassword),
                          ),
                        ),
                        const SizedBox(height: 50),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () async {
                              final userData = UserModel(
                                id: id,
                                fullName: fullName.text.trim(),
                                email: email.text.trim(),
                                phoneNo: phoneNo.text.trim(),
                                password: password.text.trim(),
                              );

                              await controller.updateRecord(userData);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: sPrimaryColor,
                              side: BorderSide.none,
                              shape: const StadiumBorder(),
                            ),
                            child: const Text(
                              "Save",
                              style: TextStyle(
                                color: sDarkColor,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: sFormHeight),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text.rich(
                              TextSpan(
                                  text: sJoined,
                                  style: TextStyle(fontSize: 12),
                                  children: [
                                    TextSpan(
                                        text: sJoinedAt,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12))
                                  ]),
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Colors.redAccent.withOpacity(.1),
                                foregroundColor: Colors.redAccent,
                                side: BorderSide.none,
                                shape: const StadiumBorder(),
                              ),
                              child: const Text(sDelete),
                            ),
                          ],
                        )
                      ]),
                    )
                  ]);
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
    ));
  }
}
