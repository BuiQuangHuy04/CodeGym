import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class GameModel {
  static const sliderStart = 50;
  static const scoreStart = 0;
  static const roundStart = 0;

  late BuildContext context;

  int targetValue;
  int sliderValue;
  int score;
  int round;

  GameModel(
    this.context, [
    this.targetValue = 50,
    this.sliderValue = sliderStart,
    this.score = scoreStart,
    this.round = roundStart,
  ]);

  @override
  String toString() {
    return 'GameModel{targetValue: $targetValue, '
        'sliderValue: $sliderValue, '
        'score: $score, '
        'round: $round}';
  }

  int getRandomNumber() => Random().nextInt(100) + 1;

  int getScore() => 100 - (sliderValue + 1 - targetValue).abs();

  void showScore() {
    score += getScore();

    var closeBtn = TextButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      child: const Text('close'),
    );

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Center(
            child: Text('Score'),
          ),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Giá trị của thanh trượt là: $sliderValue'
                  '\nBạn đạt được ${getScore()} điểm'),
            ],
          ),
          actions: [
            Center(child: closeBtn),
          ],
        );
      },
    );

    if (kDebugMode) {
      print('game_model: getScore: targetValue: $targetValue');
      print('game_model: getScore: sliderValue: $sliderValue');
      print('game_model: getScore: score: $score');
    }
  }
}
