import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_fetch_api_data/commonmodule/app_color.dart';
import 'package:getx_fetch_api_data/commonmodule/app_string.dart';

import '../controllers/product_controller.dart';

class ProductListView extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());

  ProductListView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppString.productList)),
      body: Obx(() {
        if (productController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return ListView.builder(
            itemCount: productController.productList.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: 150.0,
                        height: 100.0,
                        margin: const EdgeInsets.fromLTRB(16, 8, 8, 8),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(
                            productController.productList[index].imageLink,
                            width: 150.0,
                            height: 100.0,
                            fit: BoxFit.fill,
                            color: AppColor.purpleColor,
                            colorBlendMode: BlendMode.color,
                          ),
                        ),
                      ),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              productController.productList[index].name,
                              style: const TextStyle(fontSize: 18.0),
                            ),
                            Text(
                              productController.productList[index].brand,
                              style: const TextStyle(
                                fontSize: 14.0,
                                color: AppColor.grey,
                              ),
                            ),
                            Text(
                              productController.productList[index].category,
                              style: const TextStyle(
                                fontSize: 14.0,
                                color: AppColor.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    height: 2.0,
                    thickness: 1.0,
                    color: AppColor.grey200,
                  ),
                ],
              );
            },
          );
        }
      }),
    );
  }
}
