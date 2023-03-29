import 'package:flutter/material.dart';
import 'package:shopping/constants.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shopping/models/Product.dart';
import 'package:shopping/screens/details/components/product_title_with_image.dart';

import 'color_and_size.dart';

class Body extends StatelessWidget {
  final Product product;
  const Body({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(children: <Widget>[
        SizedBox(
          height: size.height,
          child: Stack(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: size.height * 0.3),
                padding: EdgeInsets.only(
                  top: size.height * 0.12,
                  left: kDefaultPadding,
                  right: kDefaultPadding,
                ),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24))),
                child: Column(children: <Widget>[
                  ColorAndSize(product: product),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: kDefaultPadding),
                    child: Text(product.description.toString(),
                        style: TextStyle(height: 1.5)),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CartCounter(),
                      Container(
                        padding: EdgeInsets.all(8),
                        height: 32,
                        width: 32,
                        decoration: BoxDecoration(
                            color: Color(0xFFFF6464), shape: BoxShape.circle),
                        child: SvgPicture.asset("assets/icons/heart.svg"),
                      )
                    ],
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: kDefaultPadding),
                    child: Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(right: kDefaultPadding),
                          height: 50,
                          width: 58,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18),
                              border: Border.all(color: Colors.black)),
                          child: IconButton(
                              onPressed: () {},
                              icon: SvgPicture.asset(
                                  "assets/icons/add_to_cart.svg")),
                        ),
                        Expanded(
                          child: SizedBox(
                            height: 50,
                            child: FilledButton(
                              
                              onPressed: () {},
                              child: Text(
                                "Buy Now".toLowerCase(),
                                style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),
                            
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ]),
              ),
              ProductTitleWithImage(product: product),
            ],
          ),
        )
      ]),
    );
  }
}

class CartCounter extends StatefulWidget {
  @override
  _CartCounterState createState() => _CartCounterState();
}

class _CartCounterState extends State<CartCounter> {
  int numOfItems = 1;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        buildOutlineButton(
          icon: Icons.remove,
          press: () {
            if (numOfItems > 1) {
              setState(() {
                numOfItems--;
              });
            }
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
          child: Text(
            // if our item is less  then 10 then  it shows 01 02 like that
            numOfItems.toString().padLeft(2, "0"),
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        buildOutlineButton(
            icon: Icons.add,
            press: () {
              setState(() {
                numOfItems++;
              });
            }),
      ],
    );
  }

  SizedBox buildOutlineButton(
      {required IconData icon, required VoidCallback press}) {
    return SizedBox(
      width: 40,
      height: 32,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(13),
          ),
        ),
        onPressed: press,
        child: Icon(icon),
      ),
    );
  }
}
