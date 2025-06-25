import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ltdmed/appbar/appbar.dart';
import 'package:ltdmed/drawer/drawer.dart';
import 'package:ltdmed/goodies/citizen_info_service.dart';
import 'package:ltdmed/goodies/language_service.dart';
import 'package:ltdmed/models/user/user_model.dart';
import 'package:ltdmed/models/user/user_profile_model.dart';
import 'package:ltdmed/named_routes.dart';
import 'package:ltdmed/pages/user_info/user_info_modelview.dart';

class UserInfo extends StatefulWidget {
  UserInfo({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController cccdNumberController = TextEditingController();
  final TextEditingController cmndNumberController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  @override
  State<StatefulWidget> createState() {
    return UserInfoState();
  }
}

class UserInfoState extends State<UserInfo> {
  DateTime? birthDate;
  DateTime? issuedDate;
  String gender = "male";

  @override
  void initState() {
    super.initState();
    // Initialize the email controller with the user's email
    widget.emailController.text = UserModel.instance.email;

    if (CitizenInfo.instance.cccdNumber.isNotEmpty) {
      widget.cccdNumberController.text = CitizenInfo.instance.cccdNumber;
      widget.fullNameController.text = CitizenInfo.instance.fullName;
      widget.cmndNumberController.text = CitizenInfo.instance.cmndNumber;
      birthDate = CitizenInfo.instance.dateOfBirth;
      if (CitizenInfo.instance.gender == "Nữ") {
        gender = "female";
      } else {
        gender = "male";
      }
      widget.addressController.text = CitizenInfo.instance.placeOfLiving;
      UserProfileModel.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    Future<DateTime?> selectDate() async {
      return await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1800),
        lastDate: DateTime.now(),
      );
    }

    void birthDateSelect() async {
      birthDate = await selectDate() ?? birthDate;
      print("Selected birth date: $birthDate");
      setState(() {});
    }

    void issuedDateSelect() async {
      issuedDate = await selectDate() ?? issuedDate;
      print("Selected issued date: $issuedDate");
      setState(() {});
    }

    return Scaffold(
      appBar: FAppbar(),
      drawer: FDrawer().getDrawer(context),
      body: ListenableBuilder(
        listenable: Listenable.merge([
          UserInfoModelView.instance,
          LanguageService.instance,
        ]),
        builder: (context, child) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(16, 64, 16, 16),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 16,
                children: [
                  Row(
                    children: [
                      Text(
                        LanguageService.instance.userInfoTitle,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      Expanded(child: Container()),
                      IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () {
                          // Handle edit action
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.save),
                        onPressed: () {
                          UserProfileModel.instance.address =
                              widget.addressController.text;
                          UserProfileModel.instance.fullname =
                              widget.fullNameController.text;
                          UserProfileModel.instance.cccdnumber =
                              widget.cccdNumberController.text;
                          UserProfileModel.instance.cmndnumber =
                              widget.cmndNumberController.text;
                          UserProfileModel.instance.dateofissued =
                              issuedDate?.toIso8601String() ?? '';
                          UserProfileModel.instance.dateofbirth =
                              birthDate?.toIso8601String() ?? '';
                          UserProfileModel.instance.gender = gender;
                          UserProfileModel.instance.phonenumber =
                              widget.emailController.text;
                          UserProfileModel.instance.userId =
                              UserModel.instance.id;
                          UserProfileModel.instance
                              .save()
                              .then((_) {
                                UserProfileModel.clear();
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text("save success")),
                                );
                                Navigator.pushNamed(context, NamedRoutes.home);
                              })
                              .catchError((error) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text(error.toString())),
                                );
                              });

                          // Handle save action
                        },
                      ),
                    ],
                  ),
                  TextFormField(
                    controller: widget.fullNameController,
                    decoration: InputDecoration(
                      labelText: LanguageService.instance.fullName,
                      border: OutlineInputBorder(),
                    ),
                  ),
                  TextFormField(
                    controller: widget.cccdNumberController,
                    decoration: InputDecoration(
                      labelText: LanguageService.instance.cccdNumber,
                      border: OutlineInputBorder(),
                    ),
                  ),
                  Row(
                    children: [
                      Text(LanguageService.instance.dateOfIssue),
                      TextButton(
                        onPressed: issuedDateSelect,
                        child: Text(
                          issuedDate == null
                              ? LanguageService.instance.selecteDate
                              : '${issuedDate!.day}/${issuedDate!.month}/${issuedDate!.year}',
                        ),
                      ),
                    ],
                  ),
                  TextFormField(
                    controller: widget.cmndNumberController,
                    decoration: InputDecoration(
                      labelText: LanguageService.instance.cmndNumber,
                      border: OutlineInputBorder(),
                    ),
                  ),

                  Row(
                    children: [
                      Text(LanguageService.instance.dateOfBirth),
                      TextButton(
                        onPressed: birthDateSelect,
                        child: Text(
                          birthDate == null
                              ? LanguageService.instance.selecteDate
                              : '${birthDate!.day}/${birthDate!.month}/${birthDate!.year}',
                        ),
                      ),
                    ],
                  ),

                  Row(
                    children: [
                      Text("${LanguageService.instance.gender}: "),
                      DropdownButton<String>(
                        value: gender,
                        items: [
                          DropdownMenuItem(
                            value: "male",
                            child: Text(LanguageService.instance.male),
                          ),
                          DropdownMenuItem(
                            value: "female",
                            child: Text(LanguageService.instance.female),
                          ),
                        ],
                        onChanged: (value) {
                          gender = value ?? gender;
                          setState(() {});
                        },
                      ),
                    ],
                  ),

                  TextFormField(
                    controller: widget.emailController,
                    decoration: InputDecoration(
                      labelText: LanguageService.instance.email,
                      border: OutlineInputBorder(),
                    ),
                  ),
                  TextFormField(
                    controller: widget.addressController,
                    decoration: InputDecoration(
                      labelText: LanguageService.instance.address,
                      border: OutlineInputBorder(),
                    ),
                  ),

                  TextFormField(
                    decoration: InputDecoration(
                      labelText: LanguageService.instance.phoneNumber,
                      border: OutlineInputBorder(),
                    ),
                  ),
                  Theme.of(context).platform == TargetPlatform.iOS ||
                          Theme.of(context).platform == TargetPlatform.android
                      ? Center(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              NamedRoutes.qrCodeScanner,
                            );
                          },
                          child: SizedBox(
                            width: 200,
                            child: Row(
                              spacing: 32,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.qr_code_scanner),
                                Text(
                                  LanguageService.instance.userInfoScanIDQRCode,
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                      : Container(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
