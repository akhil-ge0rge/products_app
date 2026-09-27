import 'package:flutter/foundation.dart';
import 'package:products_app/features/home/model/product_model.dart';
import 'package:products_app/features/home/repo/home_repo.dart';

class HomeViewModel extends ChangeNotifier {
  final HomeRepo repo;
  HomeViewModel(this.repo);
  List<ProductModel> products = [];
  List<ProductModel> filteredProducts = [];
  String? error;
  bool loading = false;

  Future<void> fetchProducts() async {
    try {
      error = null;
      loading = true;
      notifyListeners();

      final data = await repo.fetchProducts();
      products = data;
      filteredProducts = data;
    } catch (e) {
      error = e.toString();
    } finally {
      loading = false;
      notifyListeners();
    }
  }

  void searchProducts(String query) {
    final searchQuery = query.trim().toLowerCase();

    if (searchQuery.isEmpty) {
      filteredProducts = products;
    } else {
      filteredProducts = products.where((product) {
        final title = product.title.toLowerCase();
        final brand = product.brand.toLowerCase();

        return title.contains(searchQuery) || brand.contains(searchQuery);
      }).toList();
    }

    notifyListeners();
  }
}
