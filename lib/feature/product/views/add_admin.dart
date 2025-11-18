import 'package:flutter/material.dart';
import 'package:our_market_admin/core/components/custom_elevated_button.dart';
import 'package:our_market_admin/core/functions/build_appbar.dart';
import 'package:our_market_admin/core/functions/navigate_to.dart';
import 'package:our_market_admin/core/components/custom_text_field.dart';
import 'package:our_market_admin/feature/home/views/home.dart';

class AddAdmin extends StatefulWidget {
  // final UserDataModel user
  const AddAdmin({super.key});

  @override
  State<AddAdmin> createState() => _LoginViewState();
}

class _LoginViewState extends State<AddAdmin> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isPasswordHidden = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppBar(context, 'Add Admin', isBackButton: false),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height - kToolbarHeight,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize:
                      MainAxisSize.min, // مهم عشان الفورم ياخد مساحة محتواه فقط
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomTextFormField(
                      labelText: 'Name',
                      controller: emailController,
                    ),
                    const SizedBox(height: 20),

                    CustomTextFormField(
                      labelText: 'Email',
                      controller: emailController,
                    ),
                    const SizedBox(height: 20),
                    CustomTextFormField(
                      labelText: 'Password',
                      controller: passwordController,
                    ),
                    SizedBox(height: 20),
                    CustomElevatedButton(
                      child: const Text('Add Admin'),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
