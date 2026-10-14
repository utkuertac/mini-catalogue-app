import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class ProductImage extends StatelessWidget {
  final String url;
  final double? width;
  final double? height;

  const ProductImage({super.key, required this.url, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      url,
      width: width,
      height: height,
      fit: BoxFit.cover,
      loadingBuilder: (context, child, progress) {
        if (progress == null) return child;
        return _placeholder(null);
      },
      errorBuilder: (context, error, stackTrace) {
        return _placeholder(Icons.image_not_supported_outlined);
      },
    );
  }

  Widget _placeholder(IconData? icon) {
    return Container(
      width: width,
      height: height,
      color: AppColors.surface,
      alignment: Alignment.center,
      child: icon == null
          ? null
          : Icon(icon, color: AppColors.textSecondary),
    );
  }
}
