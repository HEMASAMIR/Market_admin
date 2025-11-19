import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:our_market_admin/core/app_colors.dart';
import 'package:our_market_admin/core/components/custom_elevated_button.dart';
import 'package:our_market_admin/core/components/custom_text_field.dart';
import 'package:our_market_admin/core/functions/build_appbar.dart';
import 'package:our_market_admin/core/functions/custom_snacK_bar.dart';
import 'package:our_market_admin/core/functions/navigate_to.dart';
import 'package:our_market_admin/feature/add_admin/cubit/addadmin_cubit/AddAdmin_cubit.dart';
import 'package:our_market_admin/feature/add_admin/cubit/addadmin_cubit/AddAdmin_state.dart';
import 'package:our_market_admin/feature/login.dart';

// Helper functions for fancy snackbars

class AddAdmin extends StatefulWidget {
  const AddAdmin({super.key});

  @override
  State<AddAdmin> createState() => _AddAdminState();
}

class _AddAdminState extends State<AddAdmin> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isPasswordHidden = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppBar(context, 'Add Admin', isBackButton: false),
      body: BlocProvider(
        create: (_) => AddAdminCubit(),
        child: BlocConsumer<AddAdminCubit, AddAdminState>(
          listener: (context, state) {
            if (state is AddAdminSuccess) {
              showSuccessSnackBar(context, 'Admin added successfully');
              navigateTo(context, LoginView());
            } else if (state is AddAdminFailure) {
              showErrorSnackBar(context, state.errorMessage);
            }
          },
          builder: (context, state) {
            AddAdminCubit cubit = context.read<AddAdminCubit>();
            return state is AddAdminLoading
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
                            mainAxisSize: MainAxisSize.min,
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
                              const SizedBox(height: 20),
                              CustomElevatedButton(
                                child: const Text('Add Admin'),
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    cubit.craeteAccount({
                                      'email': emailController.text.trim(),
                                      'password':
                                          passwordController.text.trim(),
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
