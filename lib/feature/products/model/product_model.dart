class ProductModel {
  String? productId;
  DateTime? createdAt;
  String? productName;
  String? category;
  String? price;
  String? oldPrice;
  String? description;
  String? rates;
  String? sale;
  bool? isFavourite;
  String? imageUrl;

  ProductModel({
    this.productId,
    this.createdAt,
    this.productName,
    this.category,
    this.price,
    this.oldPrice,
    this.description,
    this.rates,
    this.sale,
    this.isFavourite,
    this.imageUrl,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    productId: json['product_id'] as String?,
    createdAt:
        json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
    productName: json['product_name'] as String?,
    category: json['category'] as String?,
    price: json['price'] as String?,
    oldPrice: json['old_price'] as String?,
    description: json['description'] as String?,
    rates: json['rates'] as String?,
    sale: json['sale'] as String?,
    isFavourite: json['is_favourite'] as bool?,
    imageUrl: json['image_url'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'product_id': productId,
    'created_at': createdAt?.toIso8601String(),
    'product_name': productName,
    'category': category,
    'price': price,
    'old_price': oldPrice,
    'description': description,
    'rates': rates,
    'sale': sale,
    'is_favourite': isFavourite,
    'image_url': imageUrl,
  };
}
