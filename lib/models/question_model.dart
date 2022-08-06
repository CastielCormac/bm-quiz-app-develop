import 'package:json_annotation/json_annotation.dart';

part 'question_model.g.dart';

@JsonSerializable(createToJson: false)
class Question {
  int? id;
  String? correctAnswer;
  bool answered = false;
  String currentAnswer = '';

  Question({
    this.id,
    this.correctAnswer,
  });

  factory Question.fromJson(Map<String, dynamic> json) =>
      _$QuestionFromJson(json);
}
