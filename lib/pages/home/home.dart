import 'package:flutter/material.dart';
import 'package:ltdmed/appbar/appbar.dart';
import 'package:ltdmed/drawer/drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: FAppbar(),
        drawer: FDrawer().getDrawer(context),
        body: Center(child: Text("Home Page")),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          tooltip: 'Increment Age',
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
