// import 'package:flutter/material.dart';

// class ProductsList extends StatelessWidget {
//   const ProductsList({
//     super.key,
//     this.shrinkWrap,
//     this.physics,
//     this.query,
//     this.category,
//     this.isFavourite = false,
//   });

//   final bool? shrinkWrap;
//   final ScrollPhysics? physics;
//   final String? query;
//   final String? category;
//   final bool isFavourite;

//   @override
//   Widget build(BuildContext context) {
//     final cubit = context.read<HomeCubit>();
//     List<ProductModel> productsToShow = cubit.products;

//     // تصفية حسب البحث
//     if (query != null && query!.isNotEmpty) {
//       productsToShow =
//           productsToShow
//               .where(
//                 (p) =>
//                     p.productName!.toLowerCase().contains(query!.toLowerCase()),
//               )
//               .toList();
//     }

//     // تصفية حسب الفئة
//     if (category != null && category!.isNotEmpty) {
//       productsToShow =
//           productsToShow
//               .where(
//                 (p) => p.category!.toLowerCase() == category!.toLowerCase(),
//               )
//               .toList();
//     }

//     // حالات التحميل والخطأ
//     return Builder(
//       builder: (_) {
//         if (cubit.state is GetDataLoading) {
//           return const Center(child: CircularProgressIndicator());
//         } else if (cubit.state is GetDataError) {
//           return const Center(child: Text("Error loading products"));
//         } else if (cubit.state is GetDataSuccess && productsToShow.isEmpty) {
//           return const Center(child: Text("No products found"));
//         }

//         return ListView.builder(
//           shrinkWrap: shrinkWrap ?? true,
//           physics: physics ?? const NeverScrollableScrollPhysics(),
//           itemCount: productsToShow.length,
//           itemBuilder: (context, index) {
//             return ProductCard(
//               onPaymentSuccess: () {
//                 cubit.buyProduct(productId: productsToShow[index].productId!);
//               },
//               isFavourite: cubit.checkIsFavourite(
//                 productsToShow[index].productId!,
//               ),
//               productModel: productsToShow[index],
//               onPressed: () {
//                 bool isFavourite = cubit.checkIsFavourite(
//                   productsToShow[index].productId!,
//                 );

//                 if (isFavourite) {
//                   cubit.removeFavFromProduct(productsToShow[index].productId!);
//                 } else {
//                   cubit.addFavToProduct(productsToShow[index].productId!);
//                 }
//               },
//             );
//           },
//         );
//       },
//     );
//   }
// }
