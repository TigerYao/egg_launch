import 'package:flutter/material.dart';
import 'package:launch/pages/app_info.dart';
import 'package:launch/pages/launch_page.dart';
import 'package:service_manager/service_manager.dart';

class ILaunchImpl extends ILaunch{
  @override
  void onInit() {
    super.onInit();
    addRoute("/", Launcher());
    addRoute("/mobileInfo", MyHomePage());
  }
  @override
  String newVersion() {
   return "";
  }

  @override
  void showNewVersionUpdate({bool forceShow = false}) {

  }

  @override
  Widget createLaunchName() {
    return Launcher();
  }
}