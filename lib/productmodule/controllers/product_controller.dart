import 'package:get/get.dart';
import 'package:getx_fetch_api_data/apimodule/api_service.dart';
import 'package:getx_fetch_api_data/productmodule/models/product_model.dart';

class ProductController extends GetxController {
  var isLoading = true.obs;
  var productList = <ProductModel>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    fetchProducts();
    super.onInit();
  }

  Future<void> fetchProducts() async {
    try {
      isLoading(true);
      var products = await ApiService.fetchProduct();
      if (products != null && products != []) {
        productList.assignAll(products);
      }
    } catch (error) {
      print('Error in fetching products: $error');
    } finally {
      isLoading(false);
    }
  }
}
