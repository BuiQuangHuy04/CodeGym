import 'package:flutter/material.dart.';
import 'dart:ui' as ui;

class SliderThumbImage extends SliderComponentShape {
  SliderThumbImage({required this.image});

  final ui.Image? image;

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    // TODO: implement getPreferredSize
    return Size.zero;
  }

  @override
  void paint(PaintingContext context, Offset center,
      {required Animation<double> activationAnimation,
      required Animation<double> enableAnimation,
      required bool isDiscrete,
      required TextPainter labelPainter,
      required RenderBox parentBox,
      required SliderThemeData sliderTheme,
      required TextDirection textDirection,
      required double value,
      required double textScaleFactor,
      required Size sizeWithOverflow}) {
    if (image != null) {
      final Canvas canvas = context.canvas;
      final offset = Offset(
        center.dx - (image!.width / 2),
        center.dy - (image!.height / 2),
      );
      canvas.drawImage(
        image!,
        offset,
        Paint()..filterQuality = FilterQuality.high,
      );
    }
  }
}
