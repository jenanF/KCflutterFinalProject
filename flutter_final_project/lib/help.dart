// ignore_for_file: unused_local_variable

import 'dart:async';

import 'package:flutter/material.dart';

import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'dart:html';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:flutter_final_project/ai_services.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({super.key});

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  Future<void> perm() async {
    final permissions = await window.navigator
        .getUserMedia(
          audio: true,
        )
        .then((value) => true);
  }

  final speechToText = SpeechToText();
  final textToSpeech = FlutterTts();
  String lastWords = "";
  final AIServices aiServices = AIServices();

  @override
  void initState() {
    super.initState();
    initSpeechToText();
    initTextToSpeech();
  }

  Future<void> initTextToSpeech() async {
    await textToSpeech.setSharedInstance(true);
    setState(() {});
  }

  Future<void> initSpeechToText() async {
    await speechToText.initialize();
    setState(() {});
  }

  Future<void> startListening() async {
    await speechToText.listen(onResult: onSpeechResult);

    setState(() {});
  }

  Future<void> stopListening() async {
    await speechToText.stop();
    setState(() {});
  }

  void onSpeechResult(SpeechRecognitionResult result) {
    setState(() {
      lastWords = result.recognizedWords;
      print(lastWords);
    });
  }

  Future<void> systemSpeak(String content) async {
    await textToSpeech.speak(content);
  }

  @override
  void dispose() {
    super.dispose();
    speechToText.stop();
    textToSpeech.stop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Help",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        toolbarHeight: 65,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Text('help', style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500, color: Colors.pink),),
            SizedBox(
              height: 30,
            ),
            Image.asset("assets/images/botblack.png"),

            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(23),
                  child: Container(
                    padding: EdgeInsets.all(13),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.pink),
                        borderRadius: BorderRadius.circular(20)
                            .copyWith(topLeft: Radius.zero)),
                    child: Text(
                      "Hello, What Can I Help You With Today?",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 470, right: 26),
                  child: Container(
                    alignment: Alignment.bottomRight,
                    child: Transform.scale(
                      scale: 2,
                      child: ElevatedButton(
                        child: Icon(
                          Icons.mic,
                          color: Colors.white,
                          size: 18,
                        ),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.pink,
                            shape: CircleBorder()),
                        onPressed: () async {
                          if (await speechToText.hasPermission &&
                              speechToText.isNotListening) {
                            await startListening();
                          } else if (speechToText.isListening) {
                            final speech = await aiServices.chatAI(lastWords);
                            await systemSpeak(speech);
                            await stopListening();
                          } else {
                            initSpeechToText();
                          }
                        },
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
