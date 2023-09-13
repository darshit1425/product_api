import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product_api/utils/api_helper.dart';

import '../contoller/product_contoller.dart';

class Product_Screen extends StatefulWidget {
  const Product_Screen({super.key});

  @override
  State<Product_Screen> createState() => _Product_ScreenState();
}

class _Product_ScreenState extends State<Product_Screen> {
  Product_Contoller contoller = Get.put(Product_Contoller());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.black,
          title: Text(
            "Product data",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: FutureBuilder(
          future: contoller!.getapiData(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text("${snapshot.error}"),
              );
            } else if (snapshot.hasData) {
              return ListView.builder(
                itemCount: contoller!.productapiList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text("${contoller!.productapiList[index].id}"),
                    subtitle: Container(height:100,width:100,child: Image.network("${contoller!.productapiList[index].image}")),
                  );
                },
              );
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
