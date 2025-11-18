import 'package:flutter/material.dart';
import 'package:our_market_admin/core/components/cache_image.dart';
import 'package:our_market_admin/core/components/custom_elevated_button.dart';
import 'package:our_market_admin/core/functions/navigate_to.dart';
import 'package:our_market_admin/feature/products/views/comments.dart';
import 'package:our_market_admin/feature/products/views/edit_product_view.dart';

class CustomProductCard extends StatelessWidget {
  const CustomProductCard({super.key, this.deleteProduct});

  final void Function()? deleteProduct;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CaheImage(
              height: 150,
              width: 200,
              url:
                  "https://images.unsplash.com/photo-1602526216595-208f03c8a431",
            ),
            const SizedBox(width: 20),
            Column(
              children: [
                Text(
                  "Product Name",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Text("Product Description", style: TextStyle(fontSize: 18)),
                const SizedBox(height: 10),
                CustomElevatedButton(
                  child: const Icon(Icons.edit),
                  onPressed: () {
                    navigateTo(context, EditView());
                  },
                ),
              ],
            ),
            const SizedBox(width: 20),
            Column(
              children: [
                Text(
                  "Product Price",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Text("product.sale}", style: TextStyle(fontSize: 18)),
                const SizedBox(height: 10),
                CustomElevatedButton(
                  child: const Icon(Icons.comment),
                  onPressed: () {
                    navigateTo(context, CommentsView());
                  },
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: CustomElevatedButton(
                onPressed: deleteProduct,
                child: const Row(
                  children: [Icon(Icons.delete), Text("Delete")],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
