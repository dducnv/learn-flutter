import 'package:carousel_slider/carousel_slider.dart';
import 'package:comics_app/src/constants/color.global.dart';
import 'package:comics_app/src/ui/widgets/rank_item.dart';
import 'package:flutter/material.dart';

class RankListView extends StatelessWidget {
  const RankListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
             Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Truyện tranh',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold)),
              TextButton(
                  onPressed: () {},
                  child: Text('Tất cả >',
                      style: TextStyle(
                          color: GlobalColors.orangeColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w400)))
            ],
          ),
          CarouselSlider.builder(
              itemCount: 10,
              itemBuilder: (context, index, realIndex) {
                return RankItem();
              },
              options: CarouselOptions(
                height: 70*5,
                initialPage: 0,
                disableCenter: true,
                enlargeCenterPage: false,
                enableInfiniteScroll: false,
                aspectRatio: 2.0,
                viewportFraction: 1,
              )),
        ],
      ),
    );
  }
}
