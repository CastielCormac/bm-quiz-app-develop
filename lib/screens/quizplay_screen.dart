import 'package:bm_quiz_app/providers/question_provider.dart';
import 'package:bm_quiz_app/screens/score_screen.dart';
import 'package:bm_quiz_app/widgets/app_logo.dart';
import 'package:bm_quiz_app/widgets/custom_button.dart';
import 'package:bm_quiz_app/widgets/quiz_play_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class QuizPlayScreen extends StatefulWidget {
  const QuizPlayScreen({Key? key}) : super(key: key);

  @override
  State<QuizPlayScreen> createState() => _QuizPlayScreenState();
}

class _QuizPlayScreenState extends State<QuizPlayScreen> {
  bool isDone = false;
  String buttonTitle = 'Selesai';

  @override
  Widget build(BuildContext context) {
    final QuestionProvider questionProvider =
        Provider.of<QuestionProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const AppLogo(),
        centerTitle: true,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25.0),
          child: Column(
            children: [
              questionProvider.questions!.isEmpty
                  ? const Center(
                      child: Text("No Data"),
                    )
                  : ListView.separated(
                      itemCount: questionProvider.questions!.length,
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return QuizPlayTile(
                          question: questionProvider.questions![index],
                          index: index,
                          isDone: isDone,
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) =>
                          Container(
                        padding: const EdgeInsets.symmetric(horizontal: 28.0),
                        child: const Divider(
                          height: 40.0,
                          thickness: 2.0,
                        ),
                      ),
                    ),
              const SizedBox(height: 40.0),
              CustomButton(
                onTap: () {
                  if (isDone) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ScoreScreen(),
                      ),
                    );
                  } else {
                    questionProvider.setTotalScore = questionProvider.score;
                    setState(() {
                      isDone = true;
                      buttonTitle = 'Liat Score';
                    });
                  }
                },
                title: buttonTitle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
