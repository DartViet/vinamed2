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
  DateTime? selectedDate;
  @override
  Widget build(BuildContext context) {
    void selectDate() {
      showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1800),
        lastDate: DateTime.now(),
      ).then((pickedDate) {
        if (pickedDate != null && pickedDate != selectedDate) {
          setState(() {
            selectedDate = pickedDate;
          });
        }
      });
    }

    return Scaffold(
      appBar: FAppbar(),
      drawer: FDrawer().getDrawer(context),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 64, 16, 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 16,
            children: [
              Row(
                children: [
                  Text(
                    "User Information",
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
                      // Handle save action
                    },
                  ),
                ],
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Full Name',
                  border: OutlineInputBorder(),
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'CCCD',
                  border: OutlineInputBorder(),
                ),
              ),
              Row(
                children: [
                  Text('Ngày Cấp Thẻ: '),
                  TextButton(
                    onPressed: selectDate,
                    child: Text(
                      selectedDate == null
                          ? 'Select date'
                          : '${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}',
                    ),
                  ),
                ],
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'CMND',
                  border: OutlineInputBorder(),
                ),
              ),

              Row(
                children: [
                  Text('Date of Birth: '),
                  TextButton(
                    onPressed: selectDate,
                    child: Text(
                      selectedDate == null
                          ? 'Select date'
                          : '${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}',
                    ),
                  ),
                ],
              ),

              Row(
                children: [
                  Text("Sex: "),
                  DropdownButton<String>(
                    value: "nam",
                    items: [
                      DropdownMenuItem(value: "nam", child: Text("Nam")),
                      DropdownMenuItem(value: "nu", child: Text("Nữ")),
                    ],
                    onChanged: (value) {
                      // Handle the change
                    },
                  ),
                ],
              ),

              TextField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Address',
                  border: OutlineInputBorder(),
                ),
              ),

              TextField(
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                  border: OutlineInputBorder(),
                ),
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {},
                  child: SizedBox(
                    width: 200,
                    child: Row(
                      spacing: 32,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.qr_code_scanner),
                        Text("Scan QR Code"),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
