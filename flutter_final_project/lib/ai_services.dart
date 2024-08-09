import 'dart:convert';
// ignore: unused_import
import 'dart:io';
import 'package:flutter_final_project/key.dart';
import 'package:http/http.dart' as http;

class AIServices {
  final List<Map<String, String>> messages = [];

  Future<String> chatAI(String prompt) async {
    messages.add({
      'role': 'user',
      'content': prompt,
    });

    try {
      final response = await http.post(
        Uri.parse("https://api.openai.com/v1/chat/completions"),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $AI_api_key',
        },
        body: jsonEncode({
          "model": "gpt-3.5-turbo",
          "messages": messages,
        }),
      );
      if (response.statusCode == 200) {
        String content =
            jsonDecode(response.body)['choices'][0]['message']['content'];
        content = content.trim();

        messages.add({
          'role': 'assistant',
          'content': content,
        });
        return content;
      }

      return 'error';
    } catch (e) {
      return e.toString();
    }
  }
}
