import 'dart:convert';
import 'package:bm_quiz_app/static/static_values.dart';
import 'package:http/http.dart' as http;
import 'package:bm_quiz_app/models/question_model.dart';

Future<List<Question>?> fetchQuestions(String scannerResult) async {
  try {
    final response = await http.get(
      Uri.parse('http://$kApiURLDomain/$scannerResult'),
    );

    if (response.statusCode == 200) {
      final parsed = json.decode(response.body);
      return parsed.map<Question>((json) => Question.fromJson(json)).toList();
    } else {
      return null;
    }
  } catch (e) {
    return null;
  }
}
