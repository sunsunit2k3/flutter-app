import 'package:flutter_test/flutter_test.dart';

import '../models/district.dart';
import '../models/load_data.dart';

void main() {
  group('District Tests', () {
    testWidgets('Test District creation from map', (WidgetTester tester) async {
      await loadLocationData();

      int index = 0;

      Map<String, dynamic> map = {
        'id': districtList[index].id,
        'name': districtList[index].name,
        'level': districtList[index].level,
        'provinceId': districtList[index].provinceId,
      };

      District district = District.fromMap(map);

      expect(district.id, districtList[index].id);
      expect(district.name, districtList[index].name);
      expect(district.level, districtList[index].level);
      expect(district.provinceId, districtList[index].provinceId);
    });
  });
}
