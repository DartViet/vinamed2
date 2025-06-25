import 'package:flutter/material.dart';
import 'package:ltdmed/named_routes.dart';
import 'package:pocketbase/pocketbase.dart';

//String pockbaseServerIp = "https://localhost:2901";
//String hapiServerIp = "https://localhost:2900";

String pockbaseServerIp = "https://ltd.zapto.org/pocketbase";
String hapiServerIp = "https://ltd.zapto.org";

class PocketBaseServer {
  static PocketBaseServer? _instance;

  static PocketBaseServer get instance {
    _instance ??= PocketBaseServer();
    return _instance!;
  }

  final PocketBase pb = PocketBase(pockbaseServerIp);
  String usersCollection = "users";

  Future<RecordModel> createUser({
    required String email,
    required String password,
    required String confirmPassword,
    required BuildContext context,
    String close = 'close',
  }) async {
    final record = await pb
        .collection(usersCollection)
        .create(
          body: {
            'email': email,
            'password': password,
            'passwordConfirm': confirmPassword,
          },
        );
    return record;
  }

  Future<RecordAuth> authenticateUser({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    RecordAuth auth = await pb
        .collection(usersCollection)
        .authWithPassword(email, password);
    // ignore: use_build_context_synchronously
    Navigator.pushNamed(context, NamedRoutes.home);
    return auth;
  }

  Future<void> logoutUser() async {
    pb.authStore.clear();
  }

  Future<RecordModel> createItem(
    String itemName,
    Map<String, dynamic> body,
  ) async {
    return pb.collection(itemName).create(body: body);
  }
}
