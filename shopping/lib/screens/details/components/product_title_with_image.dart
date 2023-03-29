import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../models/Product.dart';

class ProductTitleWithImage extends StatelessWidget {
  final Product product;
  const ProductTitleWithImage({Key? key, required this.product})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Thi dep",
              style: TextStyle(color: Colors.white),
            ),
            Text(
              product.title.toString(),
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium
                  ?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: kDefaultPadding,
            ),
            Row(
              children: <Widget>[
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: "Price\n", style: TextStyle(color: Colors.white)),
                  TextSpan(
                      text: "\$${product.price}",
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium
                          ?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                ])),
                SizedBox(
                  width: kDefaultPadding,
                ),
                Expanded(
                    child: Hero(
                  tag: "${product.id}",
                  child: Image.asset(
                    product.image.toString(),
                    width: 300,
                    height: 300,
                    fit: BoxFit.contain,
                  ),
                ))
              ],
            )
          ]),
    );
  }
}
