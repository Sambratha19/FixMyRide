import 'dart:convert';
import 'package:http/http.dart' as http;

class GeminiApiService {
  static const String _baseUrl = 'https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent';
  final String _apiKey;

  GeminiApiService({required String apiKey}): _apiKey=apiKey;

  Future<String> sendMessage(String content) async {
    try {
      final response = await http.post(
        Uri.parse('$_baseUrl?key=$_apiKey'),
        headers: {'Content-Type': 'application/json'},
        body:jsonEncode({
          'contents': [
            {
              'role': 'user',
              'parts': [
                {'text': content}
              ]
            }
          ]
        }),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        String replyText = data['candidates'][0]['content']['parts'][0]['text'];

        return replyText;
      } else {
        throw Exception('Failed: ${response.statusCode} ${response.body}');
      }
    } catch (e) {
      throw Exception('API Error: $e');
    }
  }


}
