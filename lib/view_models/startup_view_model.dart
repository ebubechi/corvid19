import 'package:corvid/constants/routes.dart';
import 'package:corvid/locator.dart';
import 'package:corvid/services/auth/auths.dart';
import 'package:corvid/services/other/navigation_service.dart';
import 'package:corvid/view_models/base_model.dart';

class StartUpViewModel extends BaseModel{

  final Auths _auths = locator<Auths>();
  final NavigationService naveegate = locator<NavigationService>();

  Future startUpLogic() async{
    var userAvailable = await _auths.isUserAvailable();

    if(userAvailable){
      naveegate.navigateTo(HomeViewRoute);
    }
    else{
      naveegate.navigateTo(SignInViewRoute);
    }
  }
}