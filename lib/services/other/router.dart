import 'package:corvid/UI/authUI/signin.dart';
import 'package:corvid/UI/authUI/signup.dart';
import 'package:corvid/UI/authUI/update_profile.dart';
import 'package:corvid/UI/general/homepage.dart';
import 'package:corvid/UI/general/startUpView.dart';
import 'package:corvid/constants/routes.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SignInViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: SignIn(),
      );
    case SignUpViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: SignUp(),
      );
    case HomeViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: HomeScreen(),
      );
    case UpdateProfileViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: UserProfile(),
      );
    case StartUpViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: StartUp(),
      );
    default:
      return MaterialPageRoute(
          builder: (_) => Scaffold(
                body: Center(
                    child: Text('No route defined for ${settings.name}')),
              ));
  }
}

PageRoute _getPageRoute({String routeName, Widget viewToShow}) {
  return MaterialPageRoute(
      settings: RouteSettings(
        name: routeName,
      ),
      builder: (_) => viewToShow);
}
