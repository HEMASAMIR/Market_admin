import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:our_market_admin/core/components/cache_image.dart';
import 'package:our_market_admin/core/components/custom_elevated_button.dart';
import 'package:our_market_admin/core/components/custom_text_field.dart';
import 'package:our_market_admin/core/functions/build_appbar.dart';
import 'package:our_market_admin/feature/products/model/product_model.dart';

class EditView extends StatefulWidget {
  final ProductModel product;
  const EditView({super.key, required this.product});

  @override
  State<EditView> createState() => _EditViewState();
}

class _EditViewState extends State<EditView> {
  String? selectedValue;
  String discountPercentage = "0";

  final TextEditingController _productNameController = TextEditingController();
  final TextEditingController _oldPriceController =
      TextEditingController(); // قبل الخصم
  final TextEditingController _newPriceController =
      TextEditingController(); // بعد الخصم
  final TextEditingController _descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();

    selectedValue = widget.product.category ?? 'Electronics';

    _productNameController.text = widget.product.productName ?? '';
    _oldPriceController.text = widget.product.oldPrice ?? ''; // السعر الأصلي
    _newPriceController.text =
        widget.product.price ?? ''; // السعر الجديد بعد الخصم
    _descriptionController.text = widget.product.description ?? '';

    // نحسب الخصم عند الدخول لو موجود
    calculateDiscount();
  }

  void calculateDiscount() {
    if (_oldPriceController.text.isEmpty || _newPriceController.text.isEmpty) {
      setState(() => discountPercentage = "0");
      return;
    }

    double oldPrice = double.tryParse(_oldPriceController.text) ?? 0;
    double newPrice = double.tryParse(_newPriceController.text) ?? 0;

    if (oldPrice <= 0) {
      setState(() => discountPercentage = "0");
      return;
    }

    double result = ((oldPrice - newPrice) / oldPrice) * 100;

    setState(() {
      discountPercentage = result.round().toString();
    });

    log("Discount: $discountPercentage %");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppBar(context, 'Edit Product', isBackButton: false),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: DropdownMenu(
                    initialSelection: selectedValue,
                    onSelected: (v) => setState(() => selectedValue = v!),
                    dropdownMenuEntries: const [
                      DropdownMenuEntry(value: 'Sports', label: 'Sports'),
                      DropdownMenuEntry(
                        value: 'Electronics',
                        label: 'Electronics',
                      ),
                      DropdownMenuEntry(value: 'Books', label: 'Books'),
                      DropdownMenuEntry(value: 'Ebikes', label: 'Ebikes'),
                    ],
                  ),
                ),

                const SizedBox(width: 10),

                Column(
                  children: [
                    const Text("Discount"),
                    Text(
                      "$discountPercentage %",
                      style: const TextStyle(fontSize: 18),
                    ),
                  ],
                ),

                const SizedBox(width: 10),

                CaheImage(
                  url: "https://picsum.photos/300",
                  height: 120,
                  width: 120,
                ),
              ],
            ),

            const SizedBox(height: 20),

            CustomTextFormField(
              labelText: "Product Name",
              controller: _productNameController,
            ),

            const SizedBox(height: 20),

            CustomTextFormField(
              labelText: "Old Price (Before Discount)",
              controller: _oldPriceController,
              onChanged: (v) => calculateDiscount(),
            ),

            const SizedBox(height: 20),

            CustomTextFormField(
              labelText: "New Price (After Discount)",
              controller: _newPriceController,
              onChanged: (v) => calculateDiscount(),
            ),

            const SizedBox(height: 20),

            CustomTextFormField(
              labelText: "Description",
              controller: _descriptionController,
            ),

            const SizedBox(height: 30),

            CustomElevatedButton(
              child: const Text("Update"),
              onPressed: () {
                log("Updated Product:");
                log("Name: ${_productNameController.text}");
                log("Old Price: ${_oldPriceController.text}");
                log("New Price: ${_newPriceController.text}");
                log("Discount: $discountPercentage %");
              },
            ),
          ],
        ),
      ),
    );
  }
}
