import 'package:bambu_village_mobile/app/models/location.dart';
import 'package:bambu_village_mobile/app/modules/home/providers/home_providers.dart';
import 'package:flutter_map_marker_popup/flutter_map_marker_popup.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  List<TempatPariwisata> lokasi = [];

  RxBool isLoading = true.obs;

  final PopupController popupController = PopupController();

  final count = 0.obs;
  @override
  void onInit() {
    getData();
    super.onInit();
  }

  void getData() async {
    var json = await locationProviders();
    lokasi = json.tempatPariwisata;
    isLoading.value = false;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
