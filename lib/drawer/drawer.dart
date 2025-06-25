import 'package:flutter/material.dart';
import 'package:ltdmed/drawer/drawer_modelview.dart';
import 'package:ltdmed/goodies/language_service.dart';
import 'package:ltdmed/named_routes.dart';

class FDrawer {
  Drawer? _drawer;

  FDrawer();

  Drawer getDrawer(BuildContext context) {
    if (_drawer != null) {
      return _drawer!;
    }
    _drawer = Drawer(
      child: ListenableBuilder(
        listenable: Listenable.merge([
          DrawerModelView.instance,
          LanguageService.instance,
        ]),
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
                title: Text(LanguageService.instance.homePage),
                onTap: () {
                  Navigator.pushNamed(context, NamedRoutes.home);
                },
              ),
              ListTile(
                leading: const Icon(Icons.person),
                title: Text(LanguageService.instance.userInfo),
                onTap: () {
                  Navigator.pushNamed(context, NamedRoutes.userInfo);
                },
              ),
              ListTile(
                leading: const Icon(Icons.health_and_safety),
                title: Text(LanguageService.instance.healthRecord),
                onTap: () {
                  // Handle health record action
                },
              ),
              ListTile(
                leading: const Icon(Icons.group),
                title: Text(LanguageService.instance.staff),
                onTap: () {
                  // Handle staff action
                },
              ),
              ListTile(
                leading: const Icon(Icons.admin_panel_settings),
                title: Text(LanguageService.instance.admin),
                onTap: () {
                  // Handle admin action
                },
              ),
              const Divider(),
              SizedBox(height: 10),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Scaffold.of(context).closeDrawer();
                    Navigator.pushNamed(context, NamedRoutes.login);
                  },
                  child: Text(LanguageService.instance.login),
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
