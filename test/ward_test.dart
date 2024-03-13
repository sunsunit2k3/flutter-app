import 'package:flutter_test/flutter_test.dart';

import '../models/load_data.dart';
import '../models/ward.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  group('Ward Tests', () {
    test('Test Ward creation from map', () async {
      await loadLocationData();

      int index = 0;

      Map<String, dynamic> map = {
        'id': wardList[index].id,
        'name': wardList[index].name,
        'level': wardList[index].level,
        'districtId': wardList[index].districtId,
        'provinceId': wardList[index].provinceId,
      };

      Ward ward = Ward.fromMap(map);

      expect(ward.id, wardList[index].id);
      expect(ward.name, wardList[index].name);
      expect(ward.level, wardList[index].level);
      expect(ward.districtId, wardList[index].districtId);
      expect(ward.provinceId, wardList[index].provinceId);
    });
  });
}
