import 'package:flutter/material.dart';
import 'package:r8it/app_theme.dart';

class ImagePreview extends StatelessWidget {
  final ImageProvider? image;
  final Color? placeholderColor;

  const ImagePreview(
    this.image, {
    this.placeholderColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final screenSize = MediaQuery.of(context).size;
    final previewSize = calculatePreviewSize(screenSize);

    return Container(
      decoration: BoxDecoration(
        color: placeholderColor ?? colorScheme.gray,
        image: image != null
            ? DecorationImage(
                fit: BoxFit.fitWidth,
                alignment: FractionalOffset.center,
                image: image!,
              )
            : null,
      ),
      child: SizedBox(
        width: previewSize.width,
        height: previewSize.height,
      ),
    );
  }

  Size calculatePreviewSize(Size screenSize) {
    const maxRatio = 0.5;
    var height = screenSize.height;
    var width = screenSize.width;
    if (width < height && width / height <= maxRatio) {
      debugPrint('Preview by width');
      return Size(double.infinity, width);
    }
    debugPrint('Static preview');
    return const Size(300, 300);
  }
}
