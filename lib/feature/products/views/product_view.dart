import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:our_market_admin/core/custom_product_card.dart';
import 'package:our_market_admin/core/functions/custom_snacK_bar.dart';
import 'package:our_market_admin/feature/products/cubit/cubit/products_cubit.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsCubit()..getProducts(),
      child: BlocConsumer<ProductsCubit, ProductsState>(
        listener: (context, state) {
          if (state is GetProductsSuccess) {
            showSuccessSnackBar(context, 'Products loaded successfully');
          }
          if (state is GetProductsError) {
            showErrorSnackBar(context, 'Failed to load products');
          }
        },
        builder: (context, state) {
          ProductsCubit cubit = context.read<ProductsCubit>();
          return state is GetProductsLoading
              ? const Center(child: CircularProgressIndicator())
              : Scaffold(
                appBar: AppBar(title: Text('Products')),
                body: ListView.builder(
                  itemCount: cubit.products.length,
                  itemBuilder: (context, index) {
                    return CustomProductCard(product: cubit.products[index]);
                  },
                ),
              );
        },
      ),
    );
  }
}
