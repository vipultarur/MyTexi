
import 'package:farego/routes/routes_names.dart';
import 'package:farego/views/home/home_screen.dart';
import 'package:farego/views/splash_creen/chage_language.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class Routes{

  static final pages=[
    GetPage(name: RoutesNames.home, page: () =>HomeScreen()),
    GetPage(name: RoutesNames.chage_language, page: () =>ChangeLanguage()),
  ];
}