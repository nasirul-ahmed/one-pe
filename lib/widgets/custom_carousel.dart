import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CustomCarousel extends StatelessWidget {
  const CustomCarousel(
      {required this.images,
      required this.carouselController,
      required this.setIndex,
      required this.intialPage,
      required this.getChild,
      this.width,
      this.padding,
      Key? key})
      : super(key: key);
  final Function(int) setIndex;
  final List<String> images;
  final CarouselController carouselController;
  final int intialPage;
  final double? width;
  final double? padding;
  final Function(String, String, int) getChild;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      carouselController: carouselController,
      disableGesture: true,
      options: CarouselOptions(
        // enlargeFactor: 0,
        // enlargeCenterPage: true,
        aspectRatio: 16 / 9,
        viewportFraction: .90,
        autoPlay: true,
        initialPage: intialPage,
        onPageChanged: (index, reason) => setIndex(index),
        enableInfiniteScroll: false,
        scrollDirection: Axis.horizontal,
      ),
      itemCount: images.length,
      itemBuilder: (context, index, realIndex) {
        return getChild(images[index], "", index);
      },
    );
  }
}
