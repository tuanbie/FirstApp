import 'package:get/state_manager.dart';
import 'package:firstapp/services/remote_services.dart';

import '../Model/Product.dart';

class ProductController extends GetxController {
  var isLoading = true.obs;
  var productList = <Product>[].obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      var products = await RemoteServices.fetchProducts();
      if (products != null) {
        productList.value = products as List<Product>;
      }
    } finally {
      isLoading(false);
    }
  }
}
