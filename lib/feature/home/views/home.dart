import 'package:flutter/material.dart';
import 'package:our_market_admin/core/components/custom_elevated_button.dart';
import 'package:our_market_admin/core/functions/build_appbar.dart';

import 'package:our_market_admin/core/functions/navigate_to.dart';
import 'package:our_market_admin/feature/add_product/views/add_product.dart';
import 'package:our_market_admin/feature/add_admin/add_admin.dart';
import 'package:our_market_admin/feature/products/views/product.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppBar(context, "Home", isBackButton: false),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomElevatedButton(
              width: MediaQuery.of(context).size.width * 0.3,
              height: MediaQuery.of(context).size.height * 0.3,
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Products",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Icon(Icons.shopping_bag, size: 30),
                ],
              ),
              onPressed: () => navigateTo(context, ProductViewAdmin()),
            ),
            CustomElevatedButton(
              width: MediaQuery.of(context).size.width * 0.3,
              height: MediaQuery.of(context).size.height * 0.3,
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Add Product",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Icon(Icons.add_circle_outline, size: 30),
                ],
              ),
              onPressed: () {
                navigateTo(context, AddProduct());
              },
            ),
            CustomElevatedButton(
              width: MediaQuery.of(context).size.width * 0.3,
              height: MediaQuery.of(context).size.height * 0.3,
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Add An Admin",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Icon(Icons.person_add, size: 30),
                ],
              ),
              onPressed: () {
                navigateTo(context, AddAdmin());
              },
            ),
          ],
        ),
      ),
    );
  }
}
