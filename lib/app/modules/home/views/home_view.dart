import 'package:bambu_village_mobile/app/models/location.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_popup/flutter_map_marker_popup.dart';

import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

import '../../../widgets/dialog/popup_dialog.dart';
import '../../../widgets/markers/location_marker.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: Obx(
          () => !controller.isLoading.value
              ? FlutterMap(
                  options: MapOptions(
                    center: LatLng(-8.670919, 115.2136669),
                    maxZoom: 18,
                    minZoom: 2,
                  ),
                  children: [
                    TileLayer(
                      urlTemplate:
                          'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                      userAgentPackageName: 'dev.fleaflet.flutter_map.example',
                    ),
                    PopupMarkerLayer(
                      options: PopupMarkerLayerOptions(
                        popupController: controller.popupController,
                        markers: controller.lokasi.map(
                          (e) {
                            return LocationMarker(tempatPariwisata: e);
                          },
                        ).toList(),
                        popupDisplayOptions: PopupDisplayOptions(
                            builder: (BuildContext context, Marker marker) {
                          if (marker is LocationMarker) {
                            return PopUpDiaglog(
                                tempatPariwisata: marker.tempatPariwisata);
                          } else {
                            return Container();
                          }
                        }),
                      ),
                    ),
                  ],
                )
              : const Center(
                  child: CircularProgressIndicator(),
                ),
        ),
      ),
    );
  }
}
