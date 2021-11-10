import 'package:egg_manager/core/base_controller.dart';
import 'package:launch/model/mobile_info_entity.dart';
import 'package:launch/utils/mobile_info_utils.dart';

class MobileController extends BaseController {
   MobileInfoEntity? entity;
   MobleInfoUtils? utils;

  @override
  void onReady() {
    super.onReady();
    utils = MobleInfoUtils();
    utils?.getMobileInfoEntity().then((value) {
      entity = value;
      print("get...${entity?.app_version}");
      update(["MyHomePage"]);
    });
  }
}
