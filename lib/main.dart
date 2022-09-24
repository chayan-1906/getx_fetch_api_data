import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_fetch_api_data/commonmodule/app_color.dart';
import 'package:getx_fetch_api_data/commonmodule/app_string.dart';
import 'productmodule/views/product_list_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppString.fetchApiData,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          elevation: 0.0,
          centerTitle: true,
          color: AppColor.purpleColor,
        ),
        primarySwatch: Colors.purple,
      ),
      home: ProductListView(),
    );
  }
}
