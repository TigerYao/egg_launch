import 'package:flutter/material.dart';
import 'package:launch/pages/app_info.dart';
import 'package:launch/pages/launch_page.dart';
import 'package:egg_manager/service_manager.dart';
import 'package:launch/pages/login_widget.dart';

class ILaunchImpl extends ILaunch {
  bool _isLogin = false;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  String newVersion() {
    return "";
  }

  @override
  void showNewVersionUpdate({bool forceShow = false}) {}

  @override
  void setIsLogin(bool isLogin) {
    _isLogin = isLogin;
    update(['login']);
  }

  @override
  bool isLogin() => _isLogin;

  @override
  Widget loginWidget({required Widget loginWidget, required Widget logoutWidget}) {
    return LoginAware(loginChild: loginWidget, logoutChild: logoutWidget);
  }

  String getHomeName() {
    return AppPages.INITIAL;
  }

  @override
  GetPage getPages() {
    return GetPage(
        name: AppPages.INITIAL,
        page: () => Launcher(),
        children: [GetPage(name: AppPages.MOBLEINFO, page: () => MyHomePage())]);
  }
}
