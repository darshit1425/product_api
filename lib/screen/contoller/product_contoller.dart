import 'package:get/get.dart';
import 'package:product_api/utils/api_helper.dart';

class Product_Contoller extends GetxController{


  List<dynamic> productapiList = [];

  Future<List> getapiData() async {
    productapiList = await ApiHelper.helper.Apicall();
    return productapiList;
  }
}