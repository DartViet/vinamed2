import 'package:flutter/material.dart';
import 'package:ltdmed/appbar/appbar_viewmodel.dart';
import 'package:ltdmed/named_routes.dart';
import 'package:ltdmed/pages/home/home.dart';
import 'package:ltdmed/pages/user_info/user_info.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppbarViewmodel.instance.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Vinamed - 07SI",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
      ),
      home: HomePage(),
      routes: <String, WidgetBuilder>{
        NamedRoutes.home: (BuildContext context) => HomePage(),
        NamedRoutes.userInfo: (BuildContext context) => UserInfo(),
      },
    );
  }
}
