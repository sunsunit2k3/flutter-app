import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';

import '../models/load_data.dart';

void main() {
  testWidgets('Test loading location data', (WidgetTester tester) async {
    await loadLocationData();
    expect(provinceList.isNotEmpty, true);
    expect(districtList.isNotEmpty, true);
    expect(wardList.isNotEmpty, true);
    expect(provinceList[0].id, '01');
    expect(provinceList[0].name, 'Thành phố Hà Nội');
    expect(provinceList[0].level, 'Thành phố Trung ương');

    expect(districtList[0].id, '001');
    expect(districtList[0].name, 'Quận Ba Đình');
    expect(districtList[0].level, 'Quận');
    expect(districtList[0].provinceId, '01');

    expect(wardList[0].id, '00001');
    expect(wardList[0].name, 'Phường Phúc Xá');
    expect(wardList[0].level, 'Phường');
    expect(wardList[0].districtId, '001');
    expect(wardList[0].provinceId, '01');
    if (kDebugMode) {
      print(districtList[0].name);
    }
  });
}
