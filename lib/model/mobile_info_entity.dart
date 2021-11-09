import 'package:egg_manager/core/base_model.dart';

class MobileInfoEntity extends BaseMode{
  late String os;
  late String os_version;
  late String app_version;
  late String net_type;
  late String ip;
  late String interest;

  void fromJson(Map<String, dynamic> json) {
    if (json['system'] != null) {
      this.os = json['system'].toString();
    }
    if (json['system_version'] != null) {
      this.os_version = json['system_version'].toString();
    }
    if (json['app_version'] != null) {
      this.app_version = json['app_version'].toString();
    }
    if (json['net_type'] != null) {
      this.net_type = json['net_type'].toString();
    }
    if (json['ip'] != null) {
      this.ip = json['ip'].toString();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['system'] = this.os;
    data['system_version'] = this.os_version;
    data['app_version'] = this.app_version;
    data['net_type'] = this.net_type;
    data['ip'] = this.ip;
    return data;
  }
}