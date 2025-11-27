import 'package:flutter/material.dart';
import 'package:our_market_admin/core/components/cache_image.dart';
import 'package:our_market_admin/core/components/custom_elevated_button.dart';
import 'package:our_market_admin/core/functions/navigate_to.dart';
import 'package:our_market_admin/feature/products/comments.dart';
import 'package:our_market_admin/feature/products/edit_product_view.dart';
import 'package:our_market_admin/feature/products/model/product_model.dart';

class CustomProductCard extends StatelessWidget {
  final ProductModel product;
  const CustomProductCard({super.key, required this.product});

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
                  product.imageUrl ??
                  "https://img.freepik.com/free-photo/sale-with-special-discount-vr-glasses_23-2150040380.jpg?t=st=1736199951~exp=1736203551~hmac=4002ca903018a0edb3f886536eb961659f89a39eb31ee90a093c352ac11e5912&w=826",
            ),
            const SizedBox(width: 20),
            Column(
              children: [
                Text(
                  product.productName ?? "Product Name",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 10),
                Text(
                  product.description ?? "Product Description",
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 10),
                CustomElevatedButton(
                  child: const Icon(Icons.edit),
                  onPressed:
                      () => navigateTo(context, EditView(product: product)),
                ),
              ],
            ),
            const SizedBox(width: 20),
            Column(
              children: [
                Text(
                  product.price ?? "Product Price",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Text("${product.sale}", style: TextStyle(fontSize: 18)),
                const SizedBox(height: 10),
                CustomElevatedButton(
                  child: const Icon(Icons.comment),
                  onPressed: () => navigateTo(context, const CommentsView()),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: CustomElevatedButton(
                onPressed: () {},
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
