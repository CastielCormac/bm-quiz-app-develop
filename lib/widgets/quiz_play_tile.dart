import 'package:bm_quiz_app/models/question_model.dart';
import 'package:bm_quiz_app/providers/question_provider.dart';
import 'package:bm_quiz_app/widgets/option_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class QuizPlayTile extends StatefulWidget {
  const QuizPlayTile({
    Key? key,
    required this.question,
    required this.index,
    required this.isDone,
  }) : super(key: key);

  final Question question;
  final int index;
  final bool isDone;

  @override
  State<QuizPlayTile> createState() => _QuizPlayTileState();
}

class _QuizPlayTileState extends State<QuizPlayTile> {
  String optionSelected = "";
  @override
  Widget build(BuildContext context) {
    final QuestionProvider questionProvider =
        Provider.of<QuestionProvider>(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              'Q${widget.index + 1}',
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            flex: 2,
            child: GestureDetector(
              onTap: () {
                if (!widget.question.answered) {
                  bool condition =
                      widget.question.correctAnswer!.toLowerCase() == 'a';
                  setState(() {
                    optionSelected = 'a';
                    widget.question.answered = true;
                  });
                  if (condition) {
                    questionProvider.increaseScore();
                  }
                } else {
                  if (!widget.isDone) {
                    bool condition =
                        widget.question.correctAnswer!.toLowerCase() ==
                            optionSelected;
                    setState(() {
                      optionSelected = 'a';
                      widget.question.answered = true;
                    });
                    if (condition) {
                      questionProvider.increaseScore();
                    } else {
                      questionProvider.decreaseScore();
                    }
                  }
                }
              },
              child: OptionTile(
                option: "A",
                optionSelected: optionSelected,
                description: 'a',
                correctAnswer:
                    widget.question.correctAnswer!.toLowerCase() == 'a',
                isDone: widget.isDone,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: GestureDetector(
              onTap: () {
                if (!widget.question.answered) {
                  bool condition =
                      widget.question.correctAnswer!.toLowerCase() == 'b';
                  setState(() {
                    optionSelected = 'b';
                    widget.question.answered = true;
                  });
                  if (condition) {
                    questionProvider.increaseScore();
                  }
                } else {
                  if (!widget.isDone) {
                    bool condition =
                        widget.question.correctAnswer!.toLowerCase() ==
                            optionSelected;
                    setState(() {
                      optionSelected = 'b';
                      widget.question.answered = true;
                    });
                    if (condition) {
                      questionProvider.increaseScore();
                    } else {
                      questionProvider.decreaseScore();
                    }
                  }
                }
              },
              child: OptionTile(
                option: "B",
                optionSelected: optionSelected,
                description: 'b',
                correctAnswer:
                    widget.question.correctAnswer!.toLowerCase() == 'b',
                isDone: widget.isDone,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: GestureDetector(
              onTap: () {
                if (!widget.question.answered) {
                  bool condition =
                      widget.question.correctAnswer!.toLowerCase() == 'c';
                  setState(() {
                    optionSelected = 'c';
                    widget.question.answered = true;
                  });
                  if (condition) {
                    questionProvider.increaseScore();
                  }
                } else {
                  if (!widget.isDone) {
                    bool condition =
                        widget.question.correctAnswer!.toLowerCase() ==
                            optionSelected;
                    setState(() {
                      optionSelected = 'c';
                      widget.question.answered = true;
                    });
                    if (condition) {
                      questionProvider.increaseScore();
                    } else {
                      questionProvider.decreaseScore();
                    }
                  }
                }
              },
              child: OptionTile(
                option: "C",
                optionSelected: optionSelected,
                description: 'c',
                correctAnswer:
                    widget.question.correctAnswer!.toLowerCase() == 'c',
                isDone: widget.isDone,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: GestureDetector(
              onTap: () {
                if (!widget.question.answered) {
                  bool condition =
                      widget.question.correctAnswer!.toLowerCase() == 'd';
                  setState(() {
                    optionSelected = 'd';
                    widget.question.answered = true;
                  });
                  if (condition) {
                    questionProvider.increaseScore();
                  }
                } else {
                  if (!widget.isDone) {
                    bool condition =
                        widget.question.correctAnswer!.toLowerCase() ==
                            optionSelected;
                    setState(() {
                      optionSelected = 'd';
                      widget.question.answered = true;
                    });
                    if (condition) {
                      questionProvider.increaseScore();
                    } else {
                      questionProvider.decreaseScore();
                    }
                  }
                }
              },
              child: OptionTile(
                option: "D",
                optionSelected: optionSelected,
                description: 'd',
                correctAnswer:
                    widget.question.correctAnswer!.toLowerCase() == 'd',
                isDone: widget.isDone,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: GestureDetector(
              onTap: () {
                if (!widget.question.answered) {
                  bool condition =
                      widget.question.correctAnswer!.toLowerCase() == 'e';
                  setState(() {
                    optionSelected = 'e';
                    widget.question.answered = true;
                  });
                  if (condition) {
                    questionProvider.increaseScore();
                  }
                } else {
                  if (!widget.isDone) {
                    bool condition =
                        widget.question.correctAnswer!.toLowerCase() ==
                            optionSelected;
                    setState(() {
                      optionSelected = 'e';
                      widget.question.answered = true;
                    });
                    if (condition) {
                      questionProvider.increaseScore();
                    } else {
                      questionProvider.decreaseScore();
                    }
                  }
                }
              },
              child: OptionTile(
                option: "E",
                optionSelected: optionSelected,
                description: 'e',
                correctAnswer:
                    widget.question.correctAnswer!.toLowerCase() == 'e',
                isDone: widget.isDone,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
