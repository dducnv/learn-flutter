import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shopping/screens/details/components/body.dart';

import '../../constants.dart';
import '../../models/Product.dart';

class DetailsScreen extends StatelessWidget {
  final Product product;
  const DetailsScreen({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: product.color,
      appBar: AppBar(
          backgroundColor: product.color,
          elevation: 0,
          leading: IconButton(
            icon: SvgPicture.asset(
              'assets/icons/back.svg',
              color: Colors.white,
            ),
            onPressed: () => Navigator.pop(context),
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  "assets/icons/search.svg",
                  color: Colors.white,
                )),
            IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  "assets/icons/cart.svg",
                  color: Colors.white,
                )),
            SizedBox(
              width: kDefaultPadding / 2,
            )
          ]),
      body: Body(product: product),
    );
    
  }
}
