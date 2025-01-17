import 'dart:io';
import 'dart:ui';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:Medito/models/models.dart';

part 'device_and_app_info_repository.g.dart';

abstract class DeviceAndAppInfoRepository {
  Future<DeviceAndAppInfoModel> getDeviceAndAppInfo();
}

class DeviceInfoRepositoryImpl extends DeviceAndAppInfoRepository {
  DeviceInfoRepositoryImpl();

  @override
  Future<DeviceAndAppInfoModel> getDeviceAndAppInfo() async {
    var deviceModel;
    var deviceOS;
    var devicePlatform;
    var buildNumber;
    var appVersion;
    try {
      var deviceInfo = DeviceInfoPlugin();
      var packageInfo = await PackageInfo.fromPlatform();
      buildNumber = packageInfo.buildNumber;
      appVersion = packageInfo.version;
      var languageCode = PlatformDispatcher.instance.locale.languageCode;

      if (Platform.isIOS) {
        var iosInfo = await deviceInfo.iosInfo;
        deviceModel = iosInfo.utsname.machine;
        deviceOS = iosInfo.utsname.sysname;
        devicePlatform = 'iOS';
      } else if (Platform.isAndroid) {
        var androidInfo = await deviceInfo.androidInfo;
        deviceModel = androidInfo.model;
        deviceOS = androidInfo.version.release;
        devicePlatform = 'android';
      }

      var data = {
        'model': deviceModel,
        'os': deviceOS,
        'platform': devicePlatform,
        'buildNumber': buildNumber,
        'appVersion': appVersion,
        'languageCode': languageCode,
      };

      return DeviceAndAppInfoModel.fromJson(data);
    } catch (e) {
      rethrow;
    }
  }
}

@riverpod
DeviceAndAppInfoRepository deviceAndAppInfoRepository(_) {
  return DeviceInfoRepositoryImpl();
}
