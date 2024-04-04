import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBookImage extends StatelessWidget {
  const CustomBookImage({Key? key, required this.imageUrl}) : super(key: key);

  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius:  BorderRadius.only(
          topRight: Radius.circular(16.r), topLeft: Radius.circular(16.r),bottomRight: Radius.circular(16.r),bottomLeft: Radius.circular(16.r)),
      child: AspectRatio(
        aspectRatio: 2.6 / 4.r,
        child: CachedNetworkImage(
          fit: BoxFit.fill,
          imageUrl: imageUrl,
          errorWidget: (context, url, error) =>  Icon(
            size:24.r,
            Icons.error,
          ),
        ),
      ),
    );
  }
}
