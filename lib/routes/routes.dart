import 'package:client_commerce/pages/editor/editor_page.dart';
import 'package:get/route_manager.dart';

import 'package:client_commerce/pages/home/home_page.dart';
import 'package:client_commerce/pages/preferences/preferences_page.dart';

class Routes {
  static String defaultRoute = HomePage.routePath;

  List<GetPage> getRoutes() => [
        GetPage(
          name: Routes.defaultRoute,
          page: () => HomePage(),
        ),
        GetPage(
          name: PreferencesPage.routePath,
          page: () => PreferencesPage(),
        ),
        GetPage(
          name: EditorPage.routePath,
          page: () => EditorPage(),
        ),
      ];
}
