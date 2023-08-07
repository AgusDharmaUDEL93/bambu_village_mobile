import 'package:bambu_village_mobile/app/models/location.dart';
import 'package:bambu_village_mobile/app/modules/home/providers/home_providers.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_popup/flutter_map_marker_popup.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  List<LocationElement> lokasi = [];

  RxBool isLoading = true.obs;

  final PopupController popupController = PopupController();
  final MapController mapController = MapController();

  final count = 0.obs;
  @override
  void onInit() {
    getData();
    super.onInit();
  }

  void getData() async {
    var json = await locationProviders();
    lokasi = json.location;
    isLoading.value = false;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    mapController.dispose();
    popupController.dispose();
    super.onClose();
  }

  void onFocus(LatLng latLng, double zoom) {
    mapController.move(latLng, zoom);
  }
}
