
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:corvid/models/user_model.dart';



class ProfileData{
  // CollectionReference _userCreate = Firestore.instance.collection('User Profile');
  

  // Future userProfile(User user) async{
  //   try{
  //     await _userCreate.document(user.id).setData(user.toJson());
  //   }
  //   catch(e){
  //     return e.message;
  //   }
  // }
  // Future getUser(String uid) async{
  //   try{
  //     var userData = await _userCreate.document(uid).get();
  //     return User.fromData(userData.data);
  //   }
  //   catch(e){
  //     return e.message;
  //   }
  // }
  Future profileUpdate(User user)async{
  //   await _userCreate.document(user.id).updateData(user.toJson());
  }
}