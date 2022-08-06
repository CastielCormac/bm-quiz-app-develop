import 'package:bm_quiz_app/screens/signin_screen.dart';
import 'package:bm_quiz_app/widgets/app_logo.dart';
import 'package:bm_quiz_app/widgets/custom_button_outline.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../providers/question_provider.dart';

class ScoreScreen extends StatelessWidget {
  const ScoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppLogo(),
        centerTitle: true,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body: Consumer<QuestionProvider>(
        builder: (context, questionProvider, _) => Container(
          padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Spacer(),
              const Text(
                'Reyke your Score is',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.w300,
                ),
              ),
              const SizedBox(height: 20.0),
              Text(
                '${questionProvider.score}/${questionProvider.questions!.length}',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 42.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 42.0),
              CustomButtonOutline(
                onTap: () {
                  questionProvider.resetScore();
                  questionProvider.resetTotalScore();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignInScreen(),
                    ),
                  );
                },
                title: 'Home',
              ),
              const Spacer(),
              const Spacer(),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
