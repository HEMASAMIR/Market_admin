import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:our_market_admin/core/components/custom_elevated_button.dart';
import 'package:our_market_admin/core/functions/build_appbar.dart';
import 'package:our_market_admin/core/functions/custom_snacK_bar.dart';
import 'package:our_market_admin/core/components/custom_text_field.dart';
import 'package:our_market_admin/core/functions/navigate_without_back.dart';
import 'package:our_market_admin/feature/auth/cubit/cubit/login_cubit.dart';
import 'package:our_market_admin/feature/home/views/home.dart';

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
      appBar: buildCustomAppBar(context, 'Login As Admin', isBackButton: false),
      body: BlocProvider(
        create: (context) => LoginCubit(),
        child: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state is LoginSuccess) {
              showSuccessSnackBar(context, 'Login Successful');
              navigateWithoutBack(context, HomeView());
            }
            if (state is LoginError) {
              showErrorSnackBar(context, state.msgError);
            }
          },
          builder: (context, state) {
            LoginCubit cubit = context.read<LoginCubit>();
            return state is LoginLoading
                ? const Center(child: CircularProgressIndicator())
                : SingleChildScrollView(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height - kToolbarHeight,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            mainAxisSize:
                                MainAxisSize
                                    .min, // مهم عشان الفورم ياخد مساحة محتواه فقط
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CustomTextFormField(
                                labelText: 'Email',
                                controller: emailController,
                              ),
                              const SizedBox(height: 20),
                              CustomTextFormField(
                                isSecured: isPasswordHidden,
                                suffIcon: IconButton(
                                  icon: Icon(
                                    isPasswordHidden
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      isPasswordHidden = !isPasswordHidden;
                                    });
                                  },
                                ),
                                labelText: 'Password',
                                controller: passwordController,
                              ),
                              SizedBox(height: 20),
                              CustomElevatedButton(
                                child: const Text('Login'),
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    cubit.login({
                                      "email": emailController.text,
                                      "password": passwordController.text,
                                    });
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
          },
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
