import 'package:carousel_slider/carousel_slider.dart';
import 'package:comics_app/src/constants/color.global.dart';
import 'package:comics_app/src/models/banner.dart';
import 'package:comics_app/src/networks/network_request.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

final List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];

class HomeCarousel extends StatefulWidget {
  const HomeCarousel({Key? key}) : super(key: key);

  @override
  _HomeCarouselState createState() => _HomeCarouselState();
}

class _HomeCarouselState extends State<HomeCarousel> {
  int _activeIndex = 0;
  final carouselController = CarouselController();

  List<BannerModal> bannerData = [];

  @override
  void initState() {
    super.initState();
    NetworkRequest.fetchBanners().then((res) {
      setState(() {
        bannerData = res;
      });
    }).catchError((onError) => {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.7,
          child: Stack(
            children: [
              CarouselSlider.builder(
                  carouselController: carouselController,
                  itemCount: bannerData.length,
                  itemBuilder: (context, index, realIndex) {
                    final urlImage = bannerData[index];
                    return buildImage(urlImage.imgUrl as String, index);
                  },
                  options: CarouselOptions(
                      enableInfiniteScroll: false,
                      autoPlay: true,
                      initialPage: 0,
                      height: MediaQuery.of(context).size.height * 0.7,
                      viewportFraction: 1.0,
                      enlargeCenterPage: false,
                      onPageChanged: (index, reson) =>
                          setState(() => _activeIndex = index))),
              Container(
                  margin: EdgeInsets.only(bottom: 20),
                  alignment: Alignment.bottomCenter,
                  child: buildIndicator()),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildImage(String urlImage, int index) => Container(
      // margin: EdgeInsets.symmetric(horizontal: 12),
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: NetworkImage(
              urlImage,
            ),
            fit: BoxFit.cover),
      ),
      child: Container(
        height: 100,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.center,
                end: Alignment.bottomCenter,
                colors: [
              GlobalColors.bgColor.withOpacity(0.2),
              GlobalColors.bgColor.withOpacity(1)
            ])),
      ));

  Widget buildIndicator() => AnimatedSmoothIndicator(
        activeIndex: _activeIndex,
        onDotClicked: (index) => carouselController.animateToPage(index),
        count: imgList.length,
        effect: ScrollingDotsEffect(
            dotColor: GlobalColors.nonActiveColor.withOpacity(0.4),
            activeDotColor: GlobalColors.orangeColor,
            dotWidth: 13,
            dotHeight: 13),
      );
}
