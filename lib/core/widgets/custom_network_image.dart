import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomNetworkImage extends StatelessWidget {
  final String? imageUrl;
  final double? height;
  final BoxFit fit;

  const CustomNetworkImage({
    super.key,
    required this.imageUrl,
    this.height,
    this.fit = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    if (imageUrl == null || imageUrl!.isEmpty) {
      return const Icon(Icons.broken_image);
    }

    return CachedNetworkImage(
      imageUrl: imageUrl!,
      height: height,
      width: double.infinity,
      fit: fit,
      memCacheWidth: 300,
      memCacheHeight: 300,
      maxHeightDiskCache: 500,
      maxWidthDiskCache: 500,
      placeholder: (context, url) =>
          const Center(child: CircularProgressIndicator(strokeWidth: 2)),
      errorWidget: (context, url, error) =>
          const Icon(Icons.image_not_supported_outlined),
    );
  }
}
