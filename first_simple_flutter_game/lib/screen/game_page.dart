import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../ui/custom_slider.dart';
import '../ui/function_row.dart';
import '../ui/game_model.dart';
import '../ui/hit_me_button.dart';
import '../ui/prompt.dart';
import 'about_page.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _GamePageState();
  }
}

class _GamePageState extends State<GamePage> {
  late final CustomSlider customSlider;
  late final HitMeButton hitmeBtn;
  late final IconButton refreshBtn, infoBtn;

  late GameModel gameModel;

  AssetImage bgrImg = const AssetImage('assets/images/nub.png');

  @override
  void initState() {
    super.initState();

    gameModel = GameModel(context);

    customSlider = CustomSlider(gameModel: gameModel);

    hitmeBtn = HitMeButton(onPressed: () {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        setState(() {
          gameModel.showScore();
          gameModel.round++;
          if (kDebugMode) {
            print('main: hitmeBtn: $gameModel');
          }
        });
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print('vẽ game_page');
    }
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/nub.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //prompt value
              Prompt(gameModel: gameModel),
              //slider container
              customSlider,
              //hit me btn
              hitmeBtn,
              // function buttons row
              FunctionRow(
                gameModel: gameModel,
                refreshGame: () {
                  setState(() {
                    gameModel.targetValue = gameModel.getRandomNumber();
                    gameModel.score = 0;
                    gameModel.round = 0;
                  });
                },
                infoGame: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const AboutPage(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
