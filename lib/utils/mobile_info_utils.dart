import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:device_info/device_info.dart';
import 'package:launch/model/mobile_info_entity.dart';
import 'package:package_info/package_info.dart';
import 'package:r_get_ip/r_get_ip.dart';
import 'package:egg_manager/core/service_manager.dart';

class MobleInfoUtils {
  /// Returns [value] plus 1.
  int addOne(int value) => value + 1;
  MobileInfoEntity _entity;
  Future<dynamic> getMobileInfoEntity()async{
    _entity = MobileInfoEntity();
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if(Platform.isAndroid){
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      _entity.os = "Android";
      _entity.os_version = "Android ${androidInfo.version.release}";
      print("${_readAndroidBuildData(androidInfo)}");
    }else if(Platform.isIOS){
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      _entity.os = "IOS";
      _entity.os_version = iosInfo.systemVersion;
      print("${_readIosDeviceInfo(iosInfo)}");
    }
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    _entity.app_version = packageInfo.version;
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      // I am connected to a mobile network.
      _entity.net_type = "mobile";
    } else if (connectivityResult == ConnectivityResult.wifi) {
      // I am connected to a wifi network.
      _entity.net_type = "wifi";
    }
    _entity.ip = await RGetIp.internalIP;
    return _entity;
  }

  void updateMobileInfo(Function success,Function err)async{
    MobileInfoEntity infoEntity = await getMobileInfoEntity();
    ServiceManager().provider.getData<String>("T0296AG9SDT/B029GJCFPKQ/YPh9xGTQ9YOa7RBkXuJlh3JD", infoEntity,success: success,fail: err);
  }

  Map<String, dynamic> _readAndroidBuildData(AndroidDeviceInfo build) {
    return <String, dynamic>{
      'version.securityPatch': build.version.securityPatch,
      'version.sdkInt': build.version.sdkInt,
      'version.release': build.version.release,
      'version.previewSdkInt': build.version.previewSdkInt,
      'version.incremental': build.version.incremental,
      'version.codename': build.version.codename,
      'version.baseOS': build.version.baseOS,
      'board': build.board,
      'bootloader': build.bootloader,
      'brand': build.brand,
      'device': build.device,
      'display': build.display,
      'fingerprint': build.fingerprint,
      'hardware': build.hardware,
      'host': build.host,
      'id': build.id,
      'manufacturer': build.manufacturer,
      'model': build.model,
      'product': build.product,
      'supported32BitAbis': build.supported32BitAbis,
      'supported64BitAbis': build.supported64BitAbis,
      'supportedAbis': build.supportedAbis,
      'tags': build.tags,
      'type': build.type,
      'isPhysicalDevice': build.isPhysicalDevice,
      'androidId': build.androidId
    };
  }

  Map<String, dynamic> _readIosDeviceInfo(IosDeviceInfo data) {
    return <String, dynamic>{
      'name': data.name,
      'systemName': data.systemName,
      'systemVersion': data.systemVersion,
      'model': data.model,
      'localizedModel': data.localizedModel,
      'identifierForVendor': data.identifierForVendor,
      'isPhysicalDevice': data.isPhysicalDevice,
      'utsname.sysname:': data.utsname.sysname,
      'utsname.nodename:': data.utsname.nodename,
      'utsname.release:': data.utsname.release,
      'utsname.version:': data.utsname.version,
      'utsname.machine:': data.utsname.machine,
    };
  }
}