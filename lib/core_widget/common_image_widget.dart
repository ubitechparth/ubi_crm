import 'package:flutter/material.dart';

class CommonImageWidget extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit fit;
  final bool isCircle;
  final String placeholderImage;

  const CommonImageWidget({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.isCircle = false,
    this.placeholderImage = 'assets/placeholder.png', // Default placeholder
  });

  @override
  Widget build(BuildContext context) {
    Widget imageWidget;

    if (imageUrl.startsWith('http')) {
      // Load Network Image
      imageWidget = Image.network(
        imageUrl,
        width: width,
        height: height,
        fit: fit,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Center(child: CircularProgressIndicator());
        },
        errorBuilder: (context, error, stackTrace) {
          return Image.asset(placeholderImage, width: width, height: height, fit: fit);
        },
      );
    } else {
      // Load Asset Image
      imageWidget = Image.asset(
        imageUrl,
        width: width,
        height: height,
        fit: fit,
        errorBuilder: (context, error, stackTrace) {
          return Image.asset(placeholderImage, width: width, height: height, fit: fit);
        },
      );
    }

    return isCircle
        ? ClipOval(child: imageWidget)
        : imageWidget;
  }
}
