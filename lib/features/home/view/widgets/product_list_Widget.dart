import 'package:flutter/material.dart';
import 'package:products_app/features/home/model/product_model.dart';
import 'package:products_app/features/home/view/product_details_screen.dart';

import 'product_card.dart';

class ProductListWidget extends StatelessWidget {
  final List<ProductModel> products;
  const ProductListWidget({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: const EdgeInsets.fromLTRB(16, 4, 16, 20),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];

          return ProductCard(
            product: product,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ProductDetailScreen(product: product),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
