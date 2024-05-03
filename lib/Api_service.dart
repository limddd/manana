import 'dart:convert';

import 'package:http/http.dart' as httpd;
import 'package:manana/manana_model.dart';

class ApiService {
  Future<List<MananaModel>> getMananaApi() async {
    try {
      var url = Uri.parse("https://api.manana.kr/address/korea.json");
      List<MananaModel> mananaInstance = [];
      final response = await httpd.get(url);
      if (response.statusCode == 200) {
        final List<dynamic> mananas = jsonDecode(response.body);
        print('body : ${response.body}');
        for (var manana in mananas) {
          final LastManana = MananaModel.fromJson(manana);
          mananaInstance.add(LastManana);
        }
        print('$mananaInstance');
        return mananaInstance;
      }
    } catch (_) {
      throw Exception('error $_');
    }
    throw Error();
  }
}
