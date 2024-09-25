import 'package:flutter/material.dart';

import '../ui/text_styles.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ABOUT PAGE'),
      ),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.celebration_outlined,
                    color: Color(0xFF654AAA),
                  ),
                  Text(
                    'Bullseye',
                    style: CustomTextStyle.headline4(context),
                  ),
                  const Icon(
                    Icons.celebration_outlined,
                    color: Color(0xFF654AAA),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                'This is Bullseye. the game where you can win points and earn fame by dragging a slider.',
              ),
              const SizedBox(height: 10),
              const Text(
                'Your goal is to place the slider as close as possible to the target value. The closer your are, the more points you score.',
              ),
              const SizedBox(height: 10),
              const Text(
                'Enjoy!',
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Go Back'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
