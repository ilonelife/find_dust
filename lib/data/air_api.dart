import 'dart:convert';

import 'package:fine_dust/model/air_result.dart';
import 'package:http/http.dart' as http;

class AirApi {
  Future<AirResult> fetchData() async {
    var url = Uri.parse(
        'https://api.airvisual.com/v2/nearest_city?key=310e8baa-2fa4-4fdd-8a71-d5a0fbb8ad7e');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      // List jsonList = jsonDecode(response.body);
      // return jsonList.map((e) => AirResult.fromJson(e)).toList();
      return AirResult.fromJson(json.decode(response.body));
    } else {
      throw Exception('Fail to Load');
    }
    //AirResult result = AirResult.fromJson(json.decode(response.body));
  }
}
