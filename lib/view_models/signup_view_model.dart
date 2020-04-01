import 'package:corvid/constants/routes.dart';
import 'package:corvid/locator.dart';
// import 'package:corvid/models/user_model.dart';
import 'package:corvid/services/auth/auths.dart';
import 'package:corvid/services/other/navigation_service.dart';
import 'package:corvid/services/reg/user_profile_update.dart';
import 'package:corvid/view_models/base_model.dart';

class SignUpViewModel extends BaseModel{
  final Auths auth = locator<Auths>();
  // final ProfileData part = locator<ProfileData>();
  final NavigationService naveegate = locator<NavigationService>();


  Future signUp(email,fullname,password)async{
    setBusy(true);
    var signing = await auth.signUp(email: email,password: password,fullname: fullname);
    setBusy(false);
    if (signing is bool){
      if(signing){
        naveegate.navigateTo(HomeViewRoute);
      }
      else {
        return "Nothingness";
      }
    }
    else{
          return 'I failed you man';
    }
  }
}