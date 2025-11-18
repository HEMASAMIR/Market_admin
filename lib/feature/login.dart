import 'package:flutter/material.dart';
import 'package:our_market_admin/core/functions/build_appbar.dart';
import 'package:our_market_admin/feature/widget/widgets/custom_text_field.dart';

class LoginView extends StatefulWidget {
  // final UserDataModel user
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isPasswordHidden = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppBar(context, 'Login As Admin', isCallBack: false),
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
                      labelText: 'Email',
                      controller: emailController,
                    ),
                    const SizedBox(height: 20),
                    CustomTextFormField(
                      labelText: 'Password',
                      controller: passwordController,
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
