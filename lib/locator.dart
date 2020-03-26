import 'package:corvid/services/auth/auths.dart';
import 'package:corvid/services/other/navigation_service.dart';
import 'package:corvid/services/reg/user_registeration.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void finder(){
  locator.registerLazySingleton(() => Auths());
  locator.registerLazySingleton(() => ProfileData());
  locator.registerLazySingleton(() => NavigationService());
}