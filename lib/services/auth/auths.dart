// import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:convert';

import 'package:corvid/locator.dart';
import 'package:corvid/models/user_model.dart';
import 'package:corvid/services/reg/user_profile_update.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;


class Auths{
  final ProfileData partUpdate = locator<ProfileData>();

// SignUp user Function with the API
  Future signUp({@required String email, @required String password,@required String conpassword, @required String username,}) async{
    String signupapi = 'https://decorona.herokuapp.com/api/account/authentication/registration/';
    final signup = await http.post(signupapi, body: jsonEncode(User(
      email: email,
      password: password, 
      conpassword: conpassword,
      username: username
    )));
    if (signup.statusCode == 201){
      return "Sign Up Success";
    }
    return "Sign Up Failed :(";
  }


//  SignIn User Function with API
  Future signIn({String email, String password, String username}) async{
    String signinapi = 'https://decorona.herokuapp.com/api/account/authentication/login/';
    final signin = await http.post(signinapi, body:jsonEncode(
      User(
        email: email,
        password: password,
        username: username
        )
    ));
    if (signin.statusCode == 201){
      return "Signed In Successfully";
    }
    return "Sign in Failure";
  }

  // Google SignIn 

  // Future googleSignIn() async{
  //   try{
  //     GoogleSignInAccount google = await _gAuth.signIn();
  //     GoogleSignInAuthentication authenticate = await google.authentication;
  //     AuthCredential creden = GoogleAuthProvider
  //       .getCredential(
  //         idToken: authenticate.idToken, 
  //       accessToken: authenticate.accessToken);
  //     return creden != null;
  //   }
  //   catch(e){
  //     print(e.toString());
  //     return null;
  //   }
  // }
  // // Everything Sign-Out
  // Future signOut() async{
  //   try{
  //     _auth.signOut();
  //   }
  //   catch(e){
  //     print(e.toString());
  //     return null;
  //   }
  // }

  
  // Future googleSignOut() async{
  //   try{
  //     _gAuth.signOut();
  //   }
  //   catch(e){
  //     print(e.toString());
  //     return null;
  //   }
  // }

  Future <bool> isUserAvailable()async{
  //   var user = await _auth.currentUser();
  //   return user != null;
  }
}