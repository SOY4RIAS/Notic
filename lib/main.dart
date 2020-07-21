import 'package:client_commerce/constants.dart';
import 'package:client_commerce/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:client_commerce/routes/routes.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Routes router = Routes();

    return GetMaterialApp(
      title: AppName,
      initialRoute: Routes.defaultRoute,
      getPages: router.getRoutes(),
      debugShowCheckedModeBanner: false,
      theme: appTheme(),
      darkTheme: appTheme(type: AppThemeType.DARK),
      themeMode: ThemeMode.system,
    );
  }
}
