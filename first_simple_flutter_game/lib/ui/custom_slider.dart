import 'package:flutter/services.dart';

import 'custom_slider_thumb_shape.dart';
import 'game_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class CustomSlider extends StatefulWidget {
  const CustomSlider({
    super.key,
    required this.gameModel,
  });

  final GameModel gameModel;

  @override
  State<CustomSlider> createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  ui.Image? customThumbImg;

  Future<ui.Image> _loadImage(String assetPath) async {
    // Lấy dữ liệu ảnh theo đường dẫn asset từ gói ứng dụng
    final data = await rootBundle.load(assetPath);
    //Gọi phương thức để lấy một codec hình ảnh truyền vào bộ đệm từ dữ liệu.
    final codec = await ui.instantiateImageCodec(
      data.buffer.asUint8List(),
      targetWidth: 60,
      targetHeight: 60,
    );
    //Lấy frame từ codec
    final fi = await codec.getNextFrame();
    return fi.image;
  }

  @override
  void initState() {
    _loadImage('assets/images/nub.png').then((image) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        setState(() {
          customThumbImg = image;
        });
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print('vẽ slider');
    }
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "1",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Color(0xFF654AAA),
            ),
          ),
          Expanded(
            child: SliderTheme(
              data: SliderTheme.of(context).copyWith(
                activeTrackColor: const Color(0xFF654AAA),
                inactiveTrackColor: const Color(0xFF654AAA),
                trackHeight: 10,
                trackShape: const RoundedRectSliderTrackShape(),
                thumbColor: const Color(0xFF45307B),
                overlayColor: const Color(0xFF45307B).withAlpha(80),
                overlayShape: const RoundSliderOverlayShape(
                  overlayRadius: 30,
                ),
                thumbShape: SliderThumbImage(
                  image: customThumbImg,
                ),
              ),
              child: Slider(
                value: widget.gameModel.sliderValue.toDouble(),
                min: 0.0,
                max: 100.0,
                divisions: 1000,
                onChanged: (double newValue) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    setState(() {
                      widget.gameModel.sliderValue = newValue.round();
                      if (kDebugMode) {
                        print(
                            'CustomSlider: sliderValue: ${widget.gameModel.sliderValue}');
                      }
                    });
                  });
                },
              ),
            ),
          ),
          const Text(
            "100",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Color(0xFF654AAA),
            ),
          ),
        ],
      ),
    );
  }
}
