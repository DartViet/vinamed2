// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:ltdmed/appbar/appbar.dart';
import 'package:ltdmed/goodies/email_regex.dart';
import 'package:ltdmed/goodies/language_service.dart';
import 'package:ltdmed/goodies/server_ip.dart';
import 'package:ltdmed/models/user/user_model.dart';
import 'package:ltdmed/models/user/user_profile_model.dart';
import 'package:ltdmed/named_routes.dart';
import 'package:ltdmed/pages/user_id/login/login_modelview.dart';
import 'package:ltdmed/widgets/fsnackbar.dart';
import 'package:pocketbase/pocketbase.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<StatefulWidget> createState() {
    return LoginState();
  }
}

class LoginState extends State<Login> {
  DateTime? selectedDate;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final emailFormFieldController = TextEditingController();
  final passwordFormFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (UserModel.instance.email.isNotEmpty) {
      // If the user is already logged in, redirect to home
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (UserProfileModel.instance.userId.isEmpty) {
          print("User profile not found, redirecting to user info page.");
          // If user profile is not set, redirect to user info page
          Navigator.pushReplacementNamed(context, NamedRoutes.userInfo);
        } else {
          print("User profile found, redirecting to home page.");
          // If user profile is set, redirect to home page
          Navigator.pushReplacementNamed(context, NamedRoutes.home);
        }
      });
    }
    return Scaffold(
      appBar: FAppbar(hideUserIcon: true),
      body: ListenableBuilder(
        listenable: Listenable.merge([LoginModelView.instance, LanguageService.instance]),
        builder: (context, child) {
          return Form(
            key: _formKey,
            child: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 500, minWidth: 300),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.health_and_safety_sharp, size: 96, color: Theme.of(context).primaryColor),
                        const SizedBox(height: 16),
                        Text(LanguageService.instance.welcome, style: Theme.of(context).textTheme.titleSmall),
                        const SizedBox(height: 8),
                        TextFormField(
                          controller: emailFormFieldController,
                          validator: (value) {
                            if (value == null || value.isEmpty || !isValidEmail(value)) {
                              return LanguageService.instance.usernameNotValid;
                            }
                            return null;
                          },
                          decoration: InputDecoration(labelText: LanguageService.instance.email, border: OutlineInputBorder()),
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: passwordFormFieldController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return LanguageService.instance.passwordNotValid;
                            }
                            return null;
                          },
                          obscureText: true,
                          decoration: InputDecoration(labelText: LanguageService.instance.password, border: OutlineInputBorder()),
                        ),
                        const SizedBox(height: 32),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          spacing: 8,
                          children: [
                            Align(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, NamedRoutes.userSignup);
                                },
                                child: Text(LanguageService.instance.signup),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: ElevatedButton(
                                onPressed: () async {
                                  if (!_formKey.currentState!.validate()) {
                                    return; // If the form is not valid, do not proceed
                                  }
                                  PocketBaseServer.instance
                                      .authenticateUser(
                                        context: context,
                                        email: emailFormFieldController.text.trim().toLowerCase(),
                                        password: passwordFormFieldController.text.trim(),
                                      )
                                      .then((value) {
                                        UserProfileModel.instance
                                            .getUserProfile(value.record.id)
                                            .then((_) {
                                              if (UserProfileModel.instance.userId.isEmpty) {
                                                Navigator.pushNamed(context, NamedRoutes.userInfo);
                                              } else {
                                                Navigator.pushNamed(context, NamedRoutes.home);
                                              }
                                            })
                                            .catchError((error) {
                                              if (error is ClientException) {
                                                showFSnackBar(context, error.response['message'] ?? error.toString());
                                                Navigator.pushNamed(context, NamedRoutes.userInfo);
                                              } else {
                                                // Handle other errors
                                                showFSnackBar(context, error.toString());
                                              }
                                              return;
                                            });
                                      })
                                      .catchError((error) {
                                        if (error is ClientException) {
                                          showFSnackBar(context, error.response['message'] ?? error.toString());
                                        } else {
                                          // Handle other errors
                                          showFSnackBar(context, error.toString());
                                        }
                                        return;
                                      });
                                },
                                child: Text(LanguageService.instance.signin),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {
                              // PocketBaseServer.instance.resetPassword("darter.vn@gmail.com");
                              // Handle forgot password logic
                            },
                            child: Text("${LanguageService.instance.forgotPassword}?", style: TextStyle(fontSize: 12)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
