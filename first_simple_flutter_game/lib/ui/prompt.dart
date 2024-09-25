import 'game_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'text_styles.dart';

class Prompt extends StatefulWidget {
  const Prompt({
    super.key,
    required this.gameModel,
  });

  final GameModel gameModel;

  @override
  State<Prompt> createState() => _PromptState();
}

class _PromptState extends State<Prompt> {
  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print('vẽ prompt');
    }
    return Column(
      children: [
        Text(
          "PUT THE BULLSEYE AS CLOSE AS YOU CAN",
          style: CustomTextStyle.headline4(context),
        ),
        //random number
        Text(
          widget.gameModel.targetValue.toString(),
          style: CustomTextStyle.headline3(context),
        ),
      ],
    );
  }
}
