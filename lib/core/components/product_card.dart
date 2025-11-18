// import 'dart:developer';
// import 'package:flutter/material.dart';

// class ProductCard extends StatelessWidget {
//   const ProductCard({
//     super.key,
//     required this.productModel,
//     required this.onPressed,
//     required this.isFavourite,
//     required this.onPaymentSuccess,
//   });
//   final ProductModel productModel;
//   final void Function()? onPressed;
//   final bool isFavourite;
//   final VoidCallback onPaymentSuccess;
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {},
//       child: Card(
//         shape: const RoundedRectangleBorder(
//           borderRadius: BorderRadius.all(Radius.circular(16)),
//         ),
//         child: Column(
//           children: [
//             Stack(
//               children: [
//                 GestureDetector(
//                   onTap: () {
//                     navigateTo(
//                       context,
//                       ProductDetailsView(product: productModel),
//                     );
//                   },
//                   child: ClipRRect(
//                     borderRadius: const BorderRadius.only(
//                       topRight: Radius.circular(16),
//                       bottomRight: Radius.circular(16),
//                       bottomLeft: Radius.circular(16),
//                     ),
//                     child: CaheImage(
//                       url:
//                           productModel.imageUrl ??
//                           "https://img.freepik.com/premium-psd/kitchen-product-podium-display-background_1101917-13418.jpg?w=900",
//                     ),
//                   ),
//                 ),
//                 Positioned(
//                   child: Container(
//                     alignment: Alignment.center,
//                     width: 65,
//                     height: 35,
//                     decoration: const BoxDecoration(
//                       color: AppColors.kPrimaryColor,
//                       borderRadius: BorderRadius.only(
//                         topRight: Radius.circular(16),
//                         bottomRight: Radius.circular(16),
//                       ),
//                     ),
//                     child: Text(
//                       "${productModel.sale}% OFF",
//                       style: const TextStyle(color: AppColors.kWhiteColor),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 15),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Column(
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         productModel.productName ?? "Product Name",
//                         style: const TextStyle(
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       IconButton(
//                         onPressed: onPressed,
//                         icon: Icon(
//                           Icons.favorite,
//                           color:
//                               isFavourite
//                                   ? AppColors.kPrimaryColor
//                                   : Colors.grey,
//                         ),
//                       ),
//                     ],
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Column(
//                         children: [
//                           Text(
//                             "${productModel.price} LE",
//                             style: const TextStyle(
//                               fontSize: 18,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           Text(
//                             "${productModel.oldPrice} LE",
//                             style: const TextStyle(
//                               decoration: TextDecoration.lineThrough,
//                               fontWeight: FontWeight.bold,
//                               color: AppColors.kGreyColor,
//                             ),
//                           ),
//                         ],
//                       ),
//                       CustomEBtn(
//                         text: "Buy Now",
//                         onTap: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder:
//                                   (context) => PaymentView(
//                                     onPaymentSuccess: () {
//                                       log('Payment Success');
//                                     },
//                                     onPaymentError: () {
//                                       // Handle payment failure

//                                       log('Payment Failure');
//                                     },
//                                     price: double.parse(
//                                       productModel.price!,
//                                     ), // Required: Total price (e.g., 100 for 100 EGP)
//                                   ),
//                             ),
//                           );
//                         },
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
