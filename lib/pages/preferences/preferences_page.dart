import 'package:client_commerce/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class PreferencesPage extends StatelessWidget {
  static String routePath = '/preferences';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Preferences PAge'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Get.isDarkMode ? Icons.brightness_3 : Icons.brightness_7),
        onPressed: () {
          Get.changeTheme(
            appTheme(
              type: Get.isDarkMode ? AppThemeType.LIGHT : AppThemeType.DARK,
            ),
          );
        },
      ),
    );
  }
}
