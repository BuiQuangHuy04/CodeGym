import 'package:flutter/material.dart';

import 'text_styles.dart';

class HitMeButton extends StatelessWidget {
  const HitMeButton({
    super.key,
    required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      fillColor: const Color(0xFF654AAA),
      splashColor: const Color(0xFFBDABDA),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Text(
          'HIT ME!',
          style: CustomTextStyle.buttonContent(context),
        ),
      ),
    );
  }
}
