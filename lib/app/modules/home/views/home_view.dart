import 'package:bambu_village_mobile/app/models/location.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_popup/flutter_map_marker_popup.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';

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
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF2b411d),
        onPressed: () {
          controller.onFocus(LatLng(-8.6489, 115.2165), 13);
        },
        child: Icon(
          Icons.center_focus_strong,
        ),
      ),
      body: SafeArea(
        child: SliderDrawer(
          appBar: SliderAppBar(
            appBarPadding: EdgeInsets.all(0),
            title: Text(
              "Yayasan Bambu Lestari",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
            ),
          ),
          slider: Container(
            color: Color(0xFF2b411d),
            height: Get.height,
            child: Column(
              children: [
                Container(
                  width: Get.width,
                  padding: EdgeInsets.all(20),
                  color: Color(0xFF09311d),
                  child: Image.network(
                      "http://onemap.bambuvillage.org/img/logo-white.a2d402e2.png"),
                ),
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.symmetric(
                      vertical: 30,
                      horizontal: 20,
                    ),
                    children: [],
                  ),
                )
              ],
            ),
          ),
          child: SizedBox(
            height: Get.height,
            width: Get.width,
            child: Obx(
              () => !controller.isLoading.value
                  ? FlutterMap(
                      mapController: controller.mapController,
                      options: MapOptions(
                        center: LatLng(-8.6489, 115.2165),
                        maxZoom: 18,
                        zoom: 13,
                        minZoom: 2,
                      ),
                      children: [
                        TileLayer(
                          urlTemplate:
                              'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                          userAgentPackageName:
                              'dev.fleaflet.flutter_map.example',
                        ),
                        PopupMarkerLayer(
                          options: PopupMarkerLayerOptions(
                            popupController: controller.popupController,
                            markers: controller.lokasi.map(
                              (e) {
                                return LocationMarker(locationElement: e);
                              },
                            ).toList(),
                            popupDisplayOptions: PopupDisplayOptions(
                                builder: (BuildContext context, Marker marker) {
                              if (marker is LocationMarker) {
                                return PopUpDiaglog(
                                  locationElement: marker.locationElement,
                                );
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
        ),
      ),
    );
  }
}
