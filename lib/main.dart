// import 'package:corvid/UI/authUI/signin.dart';
// import 'package:corvid/UI/authUI/signup.dart';
import 'package:corvid/UI/authUI/signin.dart';
import 'package:corvid/UI/authUI/signup.dart';
import 'package:corvid/UI/general/startUpView.dart';
import 'package:corvid/locator.dart';
import 'package:corvid/services/other/navigation_service.dart';
import 'package:corvid/services/other/router.dart';
// import 'package:corvid/authUI/signin.dart';
import 'package:flutter/material.dart';

void main() {
  finder();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: SignUp(),
      onGenerateRoute: generateRoute,
      navigatorKey: locator<NavigationService>().navigationKey,
    );
  }
}

