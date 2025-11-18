import 'package:flutter/material.dart';
import 'package:our_market_admin/core/components/custom_circle_pro_ind.dart';
// ignore: depend_on_referenced_packages
import 'package:cached_network_image/cached_network_image.dart';

class CaheImage extends StatelessWidget {
  const CaheImage({super.key, required this.url});

  final String url;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fit: BoxFit.cover,
      height: 250,
      width: double.infinity,
      imageUrl: url,
      placeholder: (context, url) {
        return const SizedBox(height: 200, child: CustomCircleProgIndicator());
      },
      errorWidget: (context, url, error) {
        return const Icon(Icons.error);
      },
    );
  }
}
