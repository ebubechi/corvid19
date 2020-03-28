// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:corvid/locator.dart';
import 'package:corvid/models/user_model.dart';
import 'package:corvid/services/reg/user_profile_update.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Auths{
  FirebaseAuth _auth = FirebaseAuth.instance;
  GoogleSignIn _gAuth = GoogleSignIn();
  final ProfileData partUpdate = locator<ProfileData>();
  

// SignUp user Function with FirebaseAuth
  Future signUp({@required String email, @required String password, @required String fullname,}) async{
    try{
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      return user != null;
    }
    catch(e){
      print(e.toString());
      return null;
    } 
  }


//  SignIn User Function with FirebaseAuth
  Future signIn({String email, String password, String fullname}) async{
    try{
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      await partUpdate.userProfile(User( id: result.user.uid, fullname: fullname));
      return user != null;
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }

  // Google SignIn 

  Future googleSignIn() async{
    try{
      GoogleSignInAccount google = await _gAuth.signIn();
      GoogleSignInAuthentication authenticate = await google.authentication;
      AuthCredential creden = GoogleAuthProvider
        .getCredential(
          idToken: authenticate.idToken, 
        accessToken: authenticate.accessToken);
      return creden != null;
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }
  // Everything Sign-Out
  Future signOut() async{
    try{
      _auth.signOut();
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }

  
  Future googleSignOut() async{
    try{
      _gAuth.signOut();
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }

  Future <bool> isUserAvailable()async{
    var user = await _auth.currentUser();
    return user != null;
  }
}