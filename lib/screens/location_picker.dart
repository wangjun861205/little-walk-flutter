import 'package:flutter/material.dart';
import 'package:amap_flutter_base/amap_flutter_base.dart';
import 'package:amap_flutter_map/amap_flutter_map.dart';

class LocationPickerScreen extends StatelessWidget {
  late AMapController mapController;

  static const AMapPrivacyStatement amapPrivacyStatement =
      AMapPrivacyStatement(hasContains: true, hasShow: true, hasAgree: true);

  LocationPickerScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: AMapWidget(
              onMapCreated: (controller) {
                mapController = controller;
              },
              privacyStatement: amapPrivacyStatement,
            )));
  }
}
