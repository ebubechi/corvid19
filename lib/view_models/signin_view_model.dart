import 'package:corvid/constants/routes.dart';
import 'package:corvid/locator.dart';
import 'package:corvid/services/auth/auths.dart';
import 'package:corvid/services/other/navigation_service.dart';
import 'package:corvid/view_models/base_model.dart';

class SignInVIewModel extends BaseModel{
  final Auths auth = locator<Auths>();
  final NavigationService naveegate = locator<NavigationService>();


  Future signIn(email,password,username)async{
    setBusy(true);
    var signing = await auth.signIn(email: email,password: password, username: username);
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