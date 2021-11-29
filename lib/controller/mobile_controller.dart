import 'package:egg_manager/core/base_controller.dart';
import 'package:egg_manager/core/service_manager.dart';
import 'package:egg_manager/service_manager.dart';
import 'package:launch/model/mobile_info_entity.dart';
import 'package:launch/utils/mobile_info_utils.dart';

class MobileController extends BaseController {
   MobileInfoEntity? entity;
   MobleInfoUtils? utils;
   bool updateLoading =false;
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

  void reportInfo(){
    updateLoading = true;
    update();
    utils?.updateMobileInfo((data) {
      updateLoading = false;
      update();
      byService<ILaunch>().setIsLogin(true);
    }, (data) {
      updateLoading = false;
      update();
    });
  }
}
