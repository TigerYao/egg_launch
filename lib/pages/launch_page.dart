import 'package:flutter/material.dart';
import 'package:egg_manager/service_manager.dart';

class Launcher extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(onPressed: (){
          jumpToPage("/mobileInfo");
        }, child: Text("开启旅程")),
      ),
    );
  }

}