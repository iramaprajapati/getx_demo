import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:translator/translator.dart';

class TranslationController extends GetxController {
  final translator = GoogleTranslator();
  final textController = TextEditingController();
  final translatedText = ''.obs;

  TranslationController() {
    textController.addListener(_onTextChanged);
  }

  void _onTextChanged() {
    if (textController.text.isEmpty) {
      translatedText.value = '';
    }
  }

  Future<void> translateText({required String targetLanguage}) async {
    final inputText = textController.text;
    if (inputText.isNotEmpty) {
      final translation =
          await translator.translate(inputText, to: targetLanguage);
      translatedText.value = translation.text;
    } else {
      translatedText.value = '';
    }
  }

  @override
  void onClose() {
    textController.removeListener(_onTextChanged);
    textController.dispose();
    super.onClose();
  }
}
