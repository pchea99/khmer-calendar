import 'dart:async';
import 'dart:io';

import 'package:device_info/device_info.dart';

Future<int> iosVersion() async {
  var versionNumber = 0;
  if (Platform.isIOS) {
    DeviceInfoPlugin deviceInfo = new DeviceInfoPlugin();
    IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
    // print('Running on ${iosInfo.utsname.machine}');
    var version = iosInfo.systemVersion.split('.')[0];
    versionNumber = int.parse(version);
  }
  return versionNumber;
}
