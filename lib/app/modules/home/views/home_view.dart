import 'dart:math';

import 'package:bambu_village_mobile/app/models/location.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_popup/flutter_map_marker_popup.dart';

import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

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
                            // return Marker(
                            //   point: LatLng(
                            //     double.parse(e.latitude),
                            //     double.parse(e.longitude),
                            //   ),
                            //   width: 80,
                            //   height: 80,
                            //   builder: (context) => Icon(
                            //     Icons.location_pin,
                            //     size: 50,
                            //   ),
                            //   anchorPos: AnchorPos.align(AnchorAlign.top),
                            //   rotateAlignment:
                            //       AnchorAlign.top.rotationAlignment,
                            // );
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

                    // MarkerLayer(
                    //   markers: controller.lokasi.map(
                    //     (e) {
                    //       return Marker(
                    //         point: LatLng(
                    //           double.parse(e.latitude),
                    //           double.parse(e.longitude),
                    //         ),
                    //         width: 80,
                    //         height: 80,
                    //         builder: (context) => InkWell(
                    //           onTap: () {

                    //           },
                    //           child: Icon(
                    //             Icons.location_pin,
                    //             size: 50,
                    //           ),
                    //         ),
                    //       );
                    //     },
                    //   ).toList(),
                    // ),
                  ],
                )
              : Center(
                  child: CircularProgressIndicator(),
                ),
        ),
      ),
    );
  }
}

class PopUpDiaglog extends StatelessWidget {
  const PopUpDiaglog({super.key, required this.tempatPariwisata});

  final TempatPariwisata tempatPariwisata;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Container(
          constraints: const BoxConstraints(minWidth: 100, maxWidth: 200),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                tempatPariwisata.nama,
                overflow: TextOverflow.fade,
                softWrap: false,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14.0,
                ),
              ),
              const Padding(padding: EdgeInsets.symmetric(vertical: 4.0)),
              Text(
                tempatPariwisata.description,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 12.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LocationMarker extends Marker {
  LocationMarker({required this.tempatPariwisata})
      : super(
          anchorPos: AnchorPos.align(AnchorAlign.top),
          width: 80,
          height: 80,
          point: LatLng(
            double.parse(tempatPariwisata.latitude),
            double.parse(tempatPariwisata.longitude),
          ),
          builder: (context) => Icon(
            Icons.location_pin,
            size: 50,
          ),
        );
  final TempatPariwisata tempatPariwisata;
}
