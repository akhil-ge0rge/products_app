import 'package:flutter/material.dart';
import 'package:products_app/features/home/view/widgets/product_card.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../model/product_model.dart';

class ListSkeletonizer extends StatelessWidget {
  const ListSkeletonizer({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Skeletonizer(
        effect: ShimmerEffect(),
        child: ListView.builder(
          padding: const EdgeInsets.fromLTRB(16, 4, 16, 20),
          itemCount: 5,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return ProductCard(
              product: ProductModel(
                id: 1,
                title: "title",
                description: "description",
                price: 4,
                rating: 2.5,
                tags: ["tags"],
                brand: "brand",
                images: ["images"],
                thumbnail: "thumbnail",
              ),
              onTap: () {},
            );
          },
        ),
      ),
    );
  }
}
