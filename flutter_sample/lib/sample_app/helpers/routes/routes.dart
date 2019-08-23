import '../../login/login_view.dart';
import '../../user/update_page.dart';
import '../../main/main_page_view.dart';

class Router {

  static final Object routes = {
    "/main_page": (context) => MySampleAppMainPage(),
    "/login_page": (context) => LoginViewPage(),
    '/update_page': (context) => UpdatePage()
  };

}