import 'package:flutter/material.dart';
import 'package:ltdmed/appbar/appbar.dart';
import 'package:ltdmed/drawer/drawer.dart';

class UserInfo extends StatefulWidget {
  const UserInfo({super.key});

  @override
  State<StatefulWidget> createState() {
    return UserInfoState();
  }
}

class UserInfoState extends State<UserInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FAppbar(),
      drawer: FDrawer().getDrawer(context),
      body: Column(
        children: [
          Row(
            children: [
              const Icon(Icons.person, size: 50),
              const SizedBox(width: 10),
              Text("User Info", style: Theme.of(context).textTheme.bodyLarge),
            ],
          ),
        ],
      ),
    );
  }
}
