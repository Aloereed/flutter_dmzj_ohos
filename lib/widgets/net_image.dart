import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

class NetImage extends StatelessWidget {
  final String picUrl;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final double borderRadius;
  const NetImage(this.picUrl,
      {this.width,
      this.height,
      this.fit = BoxFit.cover,
      this.borderRadius = 0,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: ExtendedImage.network(
        picUrl,
        fit: fit,
        height: height,
        width: width,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(borderRadius),
        headers: const {'Referer': "http://www.dmzj.com/"},
        loadStateChanged: (e) {
          if (e.extendedImageLoadState == LoadState.loading) {
            return const Icon(
              Icons.image,
              color: Colors.grey,
              size: 24,
            );
          }
          if (e.extendedImageLoadState == LoadState.failed) {
            return const Icon(
              Icons.broken_image,
              color: Colors.grey,
              size: 24,
            );
          }
          return null;
        },
      ),
    );
  }
}
