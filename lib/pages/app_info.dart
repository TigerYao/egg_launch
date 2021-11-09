import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:launch/model/mobile_info_entity.dart';
import 'package:launch/utils/mobile_info_utils.dart';

class MyHomePage extends StatefulWidget {

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  _MyHomePageState createState() => _MyHomePageState();
}
// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold()
//   }
// }
//
class _MyHomePageState extends State<MyHomePage> {
  late MobileInfoEntity entity;
  late MobleInfoUtils utils;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    utils = MobleInfoUtils();
    utils.getMobileInfoEntity().then((value){
      entity = value;
      print("get...${entity?.app_version}");
      setState(() {

      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("YH TEST PROGECT"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: entity == null? CircularProgressIndicator(
          backgroundColor: Colors.white,
        ) :ListView(
          children: [
            ListTile(
              leading: Text("系统："),
              title: Text(entity?.os??""),
            ),
            ListTile(
              leading: Text("系统版本："),
              title: Text(entity?.os_version??""),
            ),
            ListTile(
              leading: Text("app版本："),
              title: Text(entity?.app_version??""),
            ),
            ListTile(
              leading: Text("网络："),
              title: Text(entity?.net_type??""),
            ),
            ListTile(
              leading: Text("ip地址："),
              title: Text(entity?.ip??""),
            ),
            ListTile(
              title: Text("${json.encode(entity)}"),
            ),
            ElevatedButton(onPressed: (){
              utils.updateMobileInfo((data){
                print("..dd..${data.toString()}");
              }, (e){
                print("..err....${e.toString()}");
              });
            }, child: Text("上传"))
          ],
        ),
      ),
    );
  }
}