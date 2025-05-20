import 'package:flutter/material.dart';
import 'package:ltdmed/appbar/appbar_viewmodel.dart';
import 'package:ltdmed/named_routes.dart';

class FAppbar extends StatefulWidget implements PreferredSizeWidget {
  const FAppbar({super.key});

  @override
  State<StatefulWidget> createState() {
    return FAppbarState();
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class FAppbarState extends State<FAppbar> {
  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: AppbarViewmodel.instance,
      builder: (context, child) {
        return AppBar(
          title: Center(child: Text(AppbarViewmodel.instance.title)),
          actions: <Widget>[
            Navigator.canPop(context)
                ? IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )
                : Container(),
            IconButton(
              icon: const Icon(Icons.home),
              onPressed: () {
                Navigator.pushNamed(context, NamedRoutes.home);
              },
            ),
            PopupMenuButton(
              icon: const Icon(Icons.translate),
              onSelected: (String lang) {
                AppbarViewmodel.instance.changeLang(lang);
              },
              itemBuilder: (BuildContext context) {
                return AppbarViewmodel.instance.langs.map((String lang) {
                  return PopupMenuItem<String>(value: lang, child: Text(lang));
                }).toList();
              },
            ),
          ],
        );
      },
    );
  }
}
