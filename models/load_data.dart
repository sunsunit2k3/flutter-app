import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import '../models/district.dart';
import '../models/province.dart';
import '../models/ward.dart';

List<Province> provinceList = [];
List<Ward> wardList = [];
List<District> districtList = [];

Future<void> loadLocationData() async {
  try {
    String data = await rootBundle.loadString("assets/don_vi_hanh_chinh.json");
    Map<String, dynamic> jsonData = json.decode(data);

    List<dynamic> provinceData = jsonData['province'];
    provinceList = provinceData.map((json) => Province.fromMap(json)).toList();

    List<dynamic> wardData = jsonData['ward'];
    wardList = wardData.map((json) => Ward.fromMap(json)).toList();

    List<dynamic> districtData = jsonData['district'];
    districtList = districtData.map((json) => District.fromMap(json)).toList();
  } catch (e) {
    debugPrint("Error loading location data: $e");
  }
}
