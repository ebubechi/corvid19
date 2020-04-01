import 'package:corvid/constants/routes.dart';
import 'package:corvid/locator.dart';
import 'package:corvid/models/user_model.dart';
// import 'package:corvid/models/user_model.dart';
import 'package:corvid/services/other/navigation_service.dart';
import 'package:corvid/services/reg/user_profile_update.dart';
// import 'package:corvid/services/reg/user_registeration.dart';
import 'package:corvid/view_models/base_model.dart';

class UpdateProfileViewmodel extends BaseModel{

  final ProfileData update = locator<ProfileData>();
  final NavigationService naveegate = locator<NavigationService>();

  String _selectedgender = 'Sex';
  String get selectedGender => _selectedgender;

  void setSelectedGender(dynamic gender){
    _selectedgender = gender;
    notifyListeners();
  }

  Future updateUser(username,country,address)async{
    setBusy(true);
     var rem = await update.profileUpdate(User(address: address,username: username,sex:_selectedgender,country: country));
    setBusy(false);
    if (rem is bool){
      if(rem){
        naveegate.navigateTo(HomeViewRoute);
      }
      else{
        return "Sorry mate didn't update";
      }
    }
    else {
      return "Boo who motherfucker";
    }
  }
}