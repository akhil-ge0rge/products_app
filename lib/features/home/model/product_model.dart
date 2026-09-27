class ProductModel {
  final int id;
  final String title;
  final String description;
  final double price;
  final double rating;
  final List<String> tags;
  final String brand;
  final List<String> images;
  final String thumbnail;

  ProductModel({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.rating,
    required this.tags,
    required this.brand,
    required this.images,
    required this.thumbnail,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,

      tags: (json['tags'] as List?)?.map((e) => e.toString()).toList() ?? [],

      brand: json['brand']?.toString() ?? '',

      images: List<String>.from(json['images'] ?? []),
      thumbnail: json['thumbnail'] ?? '',
    );
  }
}
