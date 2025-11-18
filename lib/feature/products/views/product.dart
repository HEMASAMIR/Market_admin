import 'package:flutter/material.dart';
import 'package:our_market_admin/feature/products/views/widget/custom_product_card.dart';

class ProductViewAdmin extends StatelessWidget {
  const ProductViewAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Products')),
      body: ListView.builder(
        itemCount: 20, // مثال عناصر أكثر من طول الشاشة
        itemBuilder: (context, index) {
          return CustomProductCard();
        },
      ),
    );
  }
}
