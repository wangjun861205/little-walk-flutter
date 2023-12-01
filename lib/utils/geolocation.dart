import 'package:geolocator/geolocator.dart';

Future<(double, double)> getCurrentLocation() async {
  final serviceEnable = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnable) {
    return Future.error("定位服务未启用");
  }
  var permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.deniedForever) {
    return Future.error("定位服务被永久禁用，请修改配置");
  }
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error("定位服务被禁用");
    }
  }
  final location = await Geolocator.getCurrentPosition();
  return (location.longitude, location.latitude);
}
