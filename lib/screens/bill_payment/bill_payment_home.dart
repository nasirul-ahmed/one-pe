import 'package:carousel_slider/carousel_slider.dart';
import 'package:go_router/go_router.dart';
import 'package:onepe/_helpers/enums.dart';
import 'package:onepe/_helpers/extenstions.dart';
import 'package:onepe/widgets/custom_fullscreen_dialog.dart';
import '/_helpers/size_utils.dart';
import '/_helpers/utils.dart';
import '/widgets/custom_carousel.dart';
import '/widgets/custom_carousel_indicator.dart';
import 'package:flutter/material.dart';
import '../../_helpers/image_constants.dart';
import 'bill_available_services.dart';

class BillPaymentHome extends StatefulWidget {
  const BillPaymentHome({super.key});

  @override
  State<BillPaymentHome> createState() => _BillPaymentHomeState();
}

class _BillPaymentHomeState extends State<BillPaymentHome> {
  late CarouselController _carouselController;
  late ScrollController _scrollController;
  List<String> _images = [];

  int currentIndex = 0;
  int activeIndex = 0;

  handleIndicator(String e) {
    int jumpTo = _images.indexOf(e);

    _carouselController.animateToPage(jumpTo,
        curve: Curves.ease, duration: const Duration(milliseconds: 200));
    setState(() {
      currentIndex = jumpTo;
    });
  }

  setIndex(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  Future<List<String>> getImages() async {
    return [
      ImageConstant.carousel1,
      ImageConstant.carousel2,
      ImageConstant.carousel3,
    ];
  }

  void fetchData() async {
    try {
      List<String> images = await getImages();
      setState(() {
        _images = images;
      });
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  void initState() {
    fetchData();
    _carouselController = CarouselController();
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: _scrollController,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          space(0, 10),
          // carousel
          SizedBox(
            height: 80,
            width: MediaQuery.of(context).size.width,
            child: CustomCarousel(
              images: _images,
              carouselController: _carouselController,
              setIndex: (e) => setIndex(e),
              intialPage: currentIndex,
              getChild: corouselWidget,
            ),
          ),
          space(0, 10),
          CustomCarouselIndicator(
            images: _images,
            handleIndicator: (e) => handleIndicator(e),
            currentIndex: currentIndex,
          ),
          space(0, 10),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: BillAvialableServices(
                addMoney: () => context.push(SCREENS.addMoney.toPath)),
          )
        ],
      ),
    );
  }

  Widget corouselWidget(String image, String title, int index) {
    return Padding(
      padding: getPadding(
        left: index % 2 == 0 ? 0 : 8,
        right: index % 2 == 1 ? 8 : 0,
      ),
      child: Container(
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image(
                image: AssetImage(image),
                height: setHeight(100),
                width: width,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
