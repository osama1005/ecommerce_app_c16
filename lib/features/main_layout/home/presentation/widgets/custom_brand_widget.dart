import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/core/resources/assets_manager.dart';
import 'package:ecommerce_app/domain/model/Brand.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBrandWidget extends StatelessWidget {
  final Brand brand;
  const CustomBrandWidget({super.key, required this.brand});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(100.r),
          child: Container(
            height: 100.h,
            width: 100.w,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child:
            CachedNetworkImage(
              height: 80,
              width: 80,
              fit: BoxFit.cover,
              imageUrl: brand.image ??'',
              placeholder: (context, url) =>
              const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) =>
              const Center(child: Icon(Icons.error)),
              imageBuilder: (context, imageProvider) {
                return Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

