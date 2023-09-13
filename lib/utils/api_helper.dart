import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:product_api/screen/model/product_model.dart';

class ApiHelper {
  static final helper = ApiHelper._();

  ApiHelper._();

  Future<List> Apicall() async {
    String apilink = "https://fakestoreapi.com/products";
    var response = await http.get(Uri.parse(apilink));
    var json = jsonDecode(response.body);

    return json.map((e) => ProductModel.fromJson(e)).toList();
  }
}
