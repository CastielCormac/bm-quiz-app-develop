import 'package:bm_quiz_app/providers/question_provider.dart';
import 'package:bm_quiz_app/screens/quizplay_screen.dart';
import 'package:bm_quiz_app/screens/scanner_screen.dart';
import 'package:bm_quiz_app/widgets/app_logo.dart';
import 'package:bm_quiz_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  late String _name;
  String? _scannerResult;

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
        builder: (context, questionProvider, _) => questionProvider.loading
            ? const Center(
                child: CircularProgressIndicator(
                  color: Colors.redAccent,
                ),
              )
            : Form(
                key: _formKey,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Spacer(),
                      if (_scannerResult != null)
                        Text(
                          _scannerResult!,
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.w600,
                            fontSize: 16.0,
                          ),
                        ),
                      TextFormField(
                        validator: (val) =>
                            val!.isEmpty ? "Masukan nama Anda" : null,
                        decoration: const InputDecoration(
                          hintText: 'Masukan Nama Anda',
                        ),
                        onChanged: (val) {
                          _name = val;
                        },
                      ),
                      const SizedBox(
                        height: 24.0,
                      ),
                      CustomButton(
                        onTap: () {
                          FocusManager.instance.primaryFocus?.unfocus();
                          setState(() {
                            _scannerResult = null;
                            scanQr(questionProvider, context);
                          });
                        },
                        title: 'Scan QR',
                      ),
                      const Spacer(),
                      const Spacer(),
                    ],
                  ),
                ),
              ),
      ),
    );
  }

  scanQr(QuestionProvider questionProvider, BuildContext context) async {
    questionProvider.toggleLoading();
    if (_formKey.currentState!.validate()) {
      _scannerResult = await _openScanner(context);
      if (_scannerResult != null) {
        if (_scannerResult!.contains('http://')) {
          _scannerResult = _scannerResult!.replaceAll('http://', '');
        }
        await questionProvider.getQuestions(_scannerResult!);
        if (questionProvider.questions != null) {
          questionProvider.name = _name;
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const QuizPlayScreen(),
            ),
          );
        } else {
          setState(() {
            _scannerResult = 'No QRCode existed in the database';
          });
        }
      }
    }
    questionProvider.toggleLoading();
  }

  Future<String?> _openScanner(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ScannerScreen(),
      ),
    );
    return result;
  }
}
