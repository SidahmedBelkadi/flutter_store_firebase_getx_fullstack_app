import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:s_store/common/shimmer/shimmer.dart';
import 'package:s_store/utils/constants/colors.dart';
import 'package:s_store/utils/constants/sizes.dart';
import 'package:s_store/utils/helpers/helper_functions.dart';

class CircularImage extends StatelessWidget {
  const CircularImage({
    super.key,
    this.width = 56,
    this.height = 56,
    this.padding = TSizes.sm,
    required this.image,
    this.backgroundColor,
    this.overlayColor,
    this.fit = BoxFit.cover,
    this.isNetworkImage = false,
    this.onPressed,
    this.borderRadius = 100,
    this.color,
  });

  final double width, height, padding;
  final String image;
  final Color? backgroundColor;
  final Color? color;
  final Color? overlayColor;
  final BoxFit fit;
  final bool isNetworkImage;
  final VoidCallback? onPressed;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: backgroundColor ??
            (THelperFunctions.isDarkMode(context)
                ? TColors.black
                : TColors.white),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: isNetworkImage
          ? ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: CachedNetworkImage(
                height: 80,
                width: 80,
                imageUrl: image,
                fit: fit,
                color: color,
                progressIndicatorBuilder: (context, url, progress) =>
                    const AppShimmerEffect(
                  width: 80,
                  height: 80,
                  radius: 100,
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            )
          : ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image(
                image: AssetImage(image),
                color: THelperFunctions.isDarkMode(context)
                    ? TColors.white
                    : TColors.dark,
              ),
            ),
    );
  }
}
