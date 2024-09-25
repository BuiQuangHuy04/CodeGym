import 'package:first_simple_flutter_game/ui/custom_icon_button.dart';

import 'game_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class FunctionRow extends StatelessWidget {
  const FunctionRow({
    super.key,
    required this.gameModel,
    required this.refreshGame,
    required this.infoGame,
  });

  final GameModel gameModel;
  final VoidCallback refreshGame;
  final VoidCallback infoGame;

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print('vẽ func_row');
    }
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          //refresh button
          CustomIconButton(
            icon: Icons.refresh,
            onPressed: () {
              refreshGame();
              if (kDebugMode) {
                print('func_row: gameModel: $gameModel');
              }
            },
          ),

          //score
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                "SCORE",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Color(0xFF654AAA),
                ),
              ),
              Text(
                gameModel.score.toString(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Color(0xFF654AAA),
                ),
              ),
            ],
          ),

          //round
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                "ROUND",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Color(0xFF654AAA),
                ),
              ),
              Text(
                gameModel.round.toString(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Color(0xFF654AAA),
                ),
              ),
            ],
          ),

          //info button
          CustomIconButton(
            icon: Icons.info_outline,
            onPressed: () {
              infoGame();
              if (kDebugMode) {
                print('func_row: gameModel: $gameModel');
              }
            },
          ),
        ],
      ),
    );
  }
}
