import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider_plus/carousel_slider_plus.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../core/helpers/constants.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/widgets/custom_loading_widget.dart';
import '../../data/models/product_details_response.dart';

class ProductImagesSlider extends StatefulWidget {
  const ProductImagesSlider({super.key, required this.productDetails});
  final ProductDetails? productDetails;
  @override
  State<ProductImagesSlider> createState() => _ProductImagesSliderState();
}

class _ProductImagesSliderState extends State<ProductImagesSlider> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    if (widget.productDetails!.productImages!.isNotEmpty) {
      return Column(
        children: [
          CarouselSlider.builder(
            controller: CarouselSliderController(),
            options: CarouselOptions(
              height: 200.h,
              autoPlay: true,
              enlargeCenterPage: true,
              onPageChanged: (index, reason) {
                setState(() {
                  activeIndex = index;
                });
              },
            ),
            itemCount: widget.productDetails!.productImages!.length,
            itemBuilder: (BuildContext context, int index, int realIndex) {
              return CachedNetworkImage(
                imageUrl:
                    '${ImagesPaths.productSliderPath}${widget.productDetails!.productImages![index].image}',
                imageBuilder: (context, imageProvider) => Container(
                  width: 200.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                placeholder: (context, url) => const CustomLoadingWidget(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              );
            },
          ),
          verticalSpace(10),
          AnimatedSmoothIndicator(
            activeIndex: activeIndex,
            count: widget.productDetails!.productImages!.length,
            effect: const SwapEffect(
              dotColor: ColorsManager.lightBlue,
              activeDotColor: ColorsManager.darkBlue,
            ),
          ),
        ],
      );
    } else {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CarouselSlider.builder(
            options: CarouselOptions(
              height: 200.h,
              autoPlay: true,
              enlargeCenterPage: true,
              onPageChanged: (index, reason) {
                setState(() {
                  activeIndex = index;
                });
              },
            ),
            itemCount: 1,
            itemBuilder: (BuildContext context, int index, int realIndex) {
              return CachedNetworkImage(
                imageUrl:
                    '${ImagesPaths.productPath}${widget.productDetails!.featureImage}',
                imageBuilder: (context, imageProvider) => Container(
                  width: 200.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                placeholder: (context, url) => const CustomLoadingWidget(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              );
            },
          ),
          verticalSpace(15),
          AnimatedSmoothIndicator(
            activeIndex: activeIndex,
            count: 1,
            effect: const SwapEffect(
              dotColor: ColorsManager.lightBlue,
              activeDotColor: ColorsManager.darkBlue,
            ),
          ),
        ],
      );
    }
  }
}
