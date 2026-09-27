import 'package:flutter/material.dart';
import 'package:products_app/features/home/model/product_model.dart';

class ProductDetailScreen extends StatelessWidget {
  final ProductModel product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F8),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Product Details',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 320,
              color: Colors.white,
              child: Image.network(
                product.thumbnail,
                fit: BoxFit.contain,
                errorBuilder: (_, _, _) {
                  return const Icon(
                    Icons.image_not_supported_outlined,
                    size: 70,
                    color: Colors.grey,
                  );
                },
              ),
            ),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.brand,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade600,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    product.title,
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 12),

                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.amber.shade50,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.star,
                              size: 18,
                              color: Colors.amber,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              product.rating.toString(),
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),

                      const Spacer(),

                      Text(
                        '\$${product.price.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: product.tags.map((tag) {
                      return Chip(
                        label: Text(tag),
                        backgroundColor: Colors.grey.shade100,
                        side: BorderSide.none,
                      );
                    }).toList(),
                  ),

                  const SizedBox(height: 28),

                  const Text(
                    'Product Details',
                    style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    product.description,
                    style: TextStyle(
                      fontSize: 15,
                      height: 1.6,
                      color: Colors.grey.shade700,
                    ),
                  ),

                  const SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
