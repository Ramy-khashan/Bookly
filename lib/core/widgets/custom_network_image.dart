import '../utils/app_assets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
 
import '../utils/size_config.dart';

class CustomNetworkImage extends StatelessWidget {
  final String imageUrl;
  final double width;
  final double height;
  final double radius;
  const CustomNetworkImage(
      {super.key,
      required this.imageUrl,
      required this.width,
      required this.height,
      required this.radius});

  @override
  Widget build(BuildContext context) {
    return Container(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        width: getWidth(width),
        height: getHeight(height),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
        ),
        child: CachedNetworkImage(
          fit: BoxFit.fill,
          imageUrl: imageUrl,
          progressIndicatorBuilder: (context, url, progress) => SizedBox(
            height: getHeight(height),
            child: Shimmer.fromColors(
              baseColor: const Color.fromARGB(255, 188, 182, 182),
              highlightColor: const Color.fromARGB(255, 255, 255, 255),
              child: Container(
                width: getWidth(width),
                height: getHeight(height),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(radius),
                  color: Colors.grey.withOpacity(.9),
                ),
              ),
            ),
          ),
          errorWidget: (context, url, error) => Container(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              width: getWidth(width),
              height: getHeight(height),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(radius),
              ),
              child: Image.asset(
                AppAssets.errorImage,
                fit: BoxFit.fill,
                width: getWidth(width),
                height: getHeight(height),
              )),
        ));
  }
}
