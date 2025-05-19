import 'package:flutter/material.dart';
import 'package:ltdmed/drawer/drawer_modelview.dart';

class FDrawer {
  Drawer? _drawer;

  FDrawer();

  Drawer getDrawer(BuildContext context) {
    if (_drawer != null) {
      return _drawer!;
    }
    _drawer = Drawer(
      child: ListenableBuilder(
        listenable: DrawerModelView.instance,
        builder: (context, child) {
          return ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Theme.of(context).primaryColor,
                  child: Icon(Icons.person, size: 50.0, color: Colors.white),
                ),
                accountName: const Text("longle"),
                accountEmail: const Text("letrongthienlong@gmail.com"),
              ),
              ListTile(
                leading: const Icon(Icons.home),
                title: Text(DrawerModelView.instance.homePage),
                onTap: () {
                  // Handle home action
                },
              ),
              ListTile(
                leading: const Icon(Icons.person),
                title: Text(DrawerModelView.instance.userInfo),
                onTap: () {
                  // Handle user info action
                },
              ),
              ListTile(
                leading: const Icon(Icons.health_and_safety),
                title: Text(DrawerModelView.instance.healthRecord),
                onTap: () {
                  // Handle health record action
                },
              ),
              ListTile(
                leading: const Icon(Icons.group),
                title: Text(DrawerModelView.instance.staff),
                onTap: () {
                  // Handle staff action
                },
              ),
              ListTile(
                leading: const Icon(Icons.admin_panel_settings),
                title: Text(DrawerModelView.instance.admin),
                onTap: () {
                  // Handle admin action
                },
              ),
              const Divider(),
              SizedBox(height: 10),
              Center(
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(DrawerModelView.instance.login),
                ),
              ),
            ],
          );
        },
      ),
    );
    return _drawer!;
  }
}
