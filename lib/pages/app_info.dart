import 'dart:convert';

import 'package:egg_manager/service_manager.dart';
import 'package:flutter/material.dart';
import 'package:launch/controller/mobile_controller.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseBuild<MobileController>(
        id: "MyHomePage",
        init: MobileController(),
        builder: (controller) => Scaffold(
              appBar: AppBar(
                title: Text("YH TEST PROGECT"),
              ),
              body: Container(
                alignment: Alignment.center,
                child: controller.entity == null
                    ? CircularProgressIndicator(
                        backgroundColor: Colors.white,
                      )
                    : ListView(
                        children: [
                          ListTile(
                            leading: Text("系统："),
                            title: Text(controller.entity?.os ?? ""),
                          ),
                          ListTile(
                            leading: Text("系统版本："),
                            title: Text(controller.entity?.os_version ?? ""),
                          ),
                          ListTile(
                            leading: Text("app版本："),
                            title: Text(controller.entity?.app_version ?? ""),
                          ),
                          ListTile(
                            leading: Text("网络："),
                            title: Text(controller.entity?.net_type ?? ""),
                          ),
                          ListTile(
                            leading: Text("ip地址："),
                            title: Text(controller.entity?.ip ?? ""),
                          ),
                          ListTile(
                            title: Text("${json.encode(controller.entity)}"),
                          ),
                          ElevatedButton(
                              onPressed: () {
                                controller.utils?.updateMobileInfo((data) {
                                  print("..dd..${data.toString()}");
                                }, (e) {
                                  print("..err....${e.toString()}");
                                });
                              },
                              child: Text("上传"))
                        ],
                      ),
              ),
            ));
  }
}
