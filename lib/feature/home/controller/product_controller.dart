import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:productlist/feature/model/product_model.dart';
import 'package:productlist/service/api_service.dart';

class ProductController extends GetxController {
  RxList<ProductModel> productList = <ProductModel>[].obs;
  RxList<ProductModel> filteredList = <ProductModel>[].obs;
  RxBool isLoading = true.obs;
  RxString selectedCategory = 'All'.obs;
  RxString searchText = ''.obs;

  late ApiService apiService = ApiService();
  List<String> categories = [
    'All',
    "men's clothing",
    'jewelery',
    'electronics',
    "women's clothing",
  ];

  @override
  void onInit() {
    getProduct();
    super.onInit();
  }

  Future<void> getProduct() async {
    try {
      print("cata...............");
      isLoading.value = true;
      update();
      http.Response response = await apiService.getProducts();
      print("2......${response.statusCode}");
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        productList.clear();
        for (var item in data) {
          productList.add(ProductModel.fromJson(item));
        }
        print("33..${productList.length}");
        applyFilters();
        update();
      }
    } catch (e) {print(e);}
  }

  void applyFilters() {
    var list =
        productList.where((product) {
          final matchCategory =selectedCategory.value == 'All' || product.category == selectedCategory.value;
          print("MatchCar...........$matchCategory");
          final matchSearch = product.title.toLowerCase().contains(

            searchText.value.toLowerCase(),
          );
          print("final Matct....${matchCategory && matchSearch} Match search.....${matchSearch}");
          return matchCategory && matchSearch;
        }).toList();
    print("List....${list.length}");
    filteredList.value = list;
    print(filteredList.value.length);
  }

  void onSearchChanged(String text) {
    searchText.value = text;
    applyFilters();
  }

  void onCategoryChanged(String? category) {
    print("onchange$category ");
    if (category != null) {

      selectedCategory.value = category;
      applyFilters();
    }
  }
}
