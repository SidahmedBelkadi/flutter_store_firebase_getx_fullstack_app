import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:s_store/common/shimmer/shimmer.dart';
import 'package:s_store/utils/constants/sizes.dart';

class CategoryShimmer extends StatelessWidget {
  const CategoryShimmer({super.key, this.itemCount = 6});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return SizedBox(
          height: 80,
          child: ListView.separated(
            itemCount: itemCount,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (_, __) {
              return const Column(
                children: [
                  // Imnage
                  AppShimmerEffect(width: 56, height: 56, radius: 56),
                  SizedBox(height: TSizes.spaceBtwItems / 2),
                  AppShimmerEffect(width: 55, height: 12),
                ],
              );
            },
            separatorBuilder: (_, __) =>
                const SizedBox(width: TSizes.spaceBtwItems),
          ),
        );
      },
    );
  }
}
