import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:demo_app/controllers/theme_controller.dart';
import 'package:demo_app/controllers/translation_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final ThemeController themeController = Get.find<ThemeController>();
  final TranslationController transCtrler = Get.put(TranslationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          Obx(
            () => IconButton(
              onPressed: () {
                themeController.toggleTheme();
              },
              icon: Icon(
                themeController.isDarkTheme.value
                    ? Icons.nightlight_round
                    : Icons.wb_sunny,
                size: 30,
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextFormField(
                controller: transCtrler.textController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter text',
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () =>
                      transCtrler.translateText(targetLanguage: 'hi'), // Hindi
                  child: const Text('Hindi'),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () => transCtrler.translateText(
                      targetLanguage: 'mr'), // Marathi
                  child: const Text('Marathi'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Obx(
              () => Text(
                transCtrler.translatedText.value,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
