import 'package:flutter/material.dart';
import 'package:products_app/features/home/model/product_model.dart';
import 'package:products_app/features/home/view-model/home_view_model.dart';
import 'package:products_app/features/home/view/widgets/list_skeletonizer.dart';
import 'package:provider/provider.dart';
import 'widgets/product_list_Widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeViewModel homeViewModel;
  @override
  void initState() {
    homeViewModel = context.read<HomeViewModel>();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      homeViewModel.fetchProducts();
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F8),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,

        title: const Text(
          'Products',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: TextField(
              onChanged: (value) =>
                  context.read<HomeViewModel>().searchProducts(value),
              decoration: InputDecoration(
                hintText: 'Search by title or brand...',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          Selector<
            HomeViewModel,
            ({List<ProductModel> product, String? error, bool loading})
          >(
            selector: (p0, p1) => (
              product: p1.filteredProducts,
              error: p1.error,
              loading: p1.loading,
            ),
            builder: (context, value, child) {
              if (value.loading) {
                return ListSkeletonizer();
              }
              if (value.error != null) {
                return Expanded(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.error_outline,
                          size: 50,
                          color: Colors.grey,
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          'Something went wrong',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          value.error ?? "Something Went Wrong",
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () {
                            context.read<HomeViewModel>().fetchProducts();
                          },
                          child: const Text('Retry'),
                        ),
                      ],
                    ),
                  ),
                );
              }

              final products = value.product;

              if (products.isEmpty) {
                return Center(child: Text("No Products Found"));
              }
              return ProductListWidget(products: products);
            },
          ),
        ],
      ),
    );
  }
}
