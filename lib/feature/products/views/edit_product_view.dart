import 'package:flutter/material.dart';
import 'package:our_market_admin/core/components/cache_image.dart';
import 'package:our_market_admin/core/components/custom_elevated_button.dart';
import 'package:our_market_admin/core/components/custom_text_field.dart';
import 'package:our_market_admin/core/functions/build_appbar.dart';

class EditView extends StatelessWidget {
  const EditView({super.key});

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
                    Column(
                      children: [
                        Text('SALE'),
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
                CustomTextFormField(labelText: 'New Price'),
                CustomTextFormField(labelText: 'Old Sale'),
                CustomTextFormField(labelText: 'Product Name'),
                CustomTextFormField(labelText: ' Description'),
                SizedBox(height: 30),
                CustomElevatedButton(child: Text('Update'), onPressed: () {}),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
