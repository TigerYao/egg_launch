import 'package:egg_manager/service_manager.dart';
import 'package:flutter/material.dart';

class LoginAware extends StatelessWidget{
  const LoginAware({
    Key? key,
    required this.loginChild,
    required this.logoutChild,
  }) : super(key: key);

  final Widget loginChild;
  final Widget logoutChild;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ILaunch>(
      id: 'login',
      builder: (controller) => controller.isLogin() ? loginChild : logoutChild,
    );
  }

}