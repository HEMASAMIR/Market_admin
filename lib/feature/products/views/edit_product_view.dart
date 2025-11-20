import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:our_market_admin/core/components/cache_image.dart';
import 'package:our_market_admin/core/components/custom_elevated_button.dart';
import 'package:our_market_admin/core/components/custom_text_field.dart';
import 'package:our_market_admin/core/functions/build_appbar.dart';
import 'package:our_market_admin/core/functions/shared_pref.dart';

class EditView extends StatefulWidget {
  const EditView({super.key});

  @override
  State<EditView> createState() => _EditViewState();
}

class _EditViewState extends State<EditView> {
  String selectedValue = 'Electronics';
  String sale = '10';
  final TextEditingController _productNameController = TextEditingController();
  final TextEditingController _newPriceController = TextEditingController();
  final TextEditingController _oldPriceController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppBar(context, 'Edit Product', isBackButton: false),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    DropdownMenu(
                      initialSelection: selectedValue,
                      onSelected: (value) {
                        setState(() {
                          selectedValue = value ?? 'Collections';
                        });
                      },
                      dropdownMenuEntries: [
                        DropdownMenuEntry(value: 'Sports', label: 'Sports'),
                        DropdownMenuEntry(
                          value: 'Electronics',
                          label: 'Electronics',
                        ),
                        DropdownMenuEntry(
                          value: 'Collections',
                          label: 'Collections',
                        ),
                        DropdownMenuEntry(value: 'Books', label: 'Books'),
                      ],
                    ),
                    SizedBox(width: 10),
                    Column(
                      children: [
                        Text('$sale %'),
                        SizedBox(height: 10),
                        Text('10 %'),
                      ],
                    ),
                    CaheImage(
                      url: 'https://picsum.photos/200/300',
                      height: 250,
                      width: 350,
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomElevatedButton(
                      child: Icon(Icons.upload_file_rounded),
                      onPressed: () {},
                    ),
                    SizedBox(width: 10),
                    CustomElevatedButton(
                      child: Icon(Icons.image_outlined),
                      onPressed: () {},
                    ),
                  ],
                ),
                SizedBox(height: 10),
                CustomTextFormField(
                  labelText: 'New Price',
                  controller: _newPriceController,
                ),
                SizedBox(height: 10),

                CustomTextFormField(
                  labelText: 'Old Sale',
                  controller: _oldPriceController,
                ),
                SizedBox(height: 10),

                CustomTextFormField(
                  labelText: 'Product Name',
                  controller: _productNameController,
                ),
                SizedBox(height: 10),

                CustomTextFormField(
                  labelText: ' Description',
                  controller: _descriptionController,
                ),
                SizedBox(height: 30),
                CustomElevatedButton(
                  child: Text('Update'),
                  onPressed: () async {
                    String? token = await SharedPref.getToken();
                    log('Token  ======= :  $token');
                  },
                  width: 150,
                  height: 150,
                ),
                SizedBox(height: 30),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _productNameController.dispose();
    _oldPriceController.dispose();
    _newPriceController.dispose();
    _descriptionController.dispose();

    super.dispose();
  }
}
