import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:my_app/model/data_model.dart';

class DataServices {
  String baseUrl = "http://mark.bslmeiyu.com/api";

  Future<List<DataModel>> getInfo() async {
    var apiUrl = "/getplaces";
    http.Response res = await http.get(Uri.parse(baseUrl + apiUrl));
    try {
      if (res.statusCode == 200) {
        List<dynamic> list = jsonDecode(res.body);
        return list.map((e) => DataModel.fromJson(e)).toList();
      }
      return <DataModel>[];
    } catch (err) {
      print("Here is Error ya Doaaaaaaaaa");
      print(err);
      return <DataModel>[];
    }
  }
}
