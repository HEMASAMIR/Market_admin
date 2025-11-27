import 'package:flutter/material.dart';
import 'package:our_market_admin/feature/home/view/home.dart';

void main() {
  runApp(const OurMarketAdmin());
}

class OurMarketAdmin extends StatelessWidget {
  const OurMarketAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Our Market Admin',

      debugShowCheckedModeBanner: false,
      home: HomeView(),
    );
  }
}
