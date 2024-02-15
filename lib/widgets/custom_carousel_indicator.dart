import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../_helpers/size_utils.dart';
import '../_helpers/themes/my_colors.dart';
import '../providers/theme_manager.dart';

class CustomCarouselIndicator extends StatelessWidget {
  final List<String> images;
  final Function(String) handleIndicator;
  final int currentIndex;
  const CustomCarouselIndicator({
    super.key,
    required this.images,
    required this.handleIndicator,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    return Container(
      alignment: Alignment.topLeft,
      padding: const EdgeInsets.only(left: 20, top: 10, bottom: 10),
      width: setWidth(90),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: images.map((String image) {
          var isImageMatched = images.indexOf(image) == currentIndex;
          // print(isImageMatched);
          // print(image);
          return InkWell(
            onTap: () => handleIndicator(image),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              height: setHeight(8),
              width: isImageMatched ? 25 : 15,
              decoration: BoxDecoration(
                color: isImageMatched
                    ? themeProvider.themeMode == ThemeMode.dark
                        ? MyColors.white
                        : MyColors.black900
                    : Colors.grey,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
