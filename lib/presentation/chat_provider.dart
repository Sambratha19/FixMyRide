import 'package:login/data/claude_api_service.dart';
import 'package:login/model1/message.dart';
import 'package:flutter/cupertino.dart';

class ChatProvider with ChangeNotifier {
  final _apiService = GeminiApiService(apiKey: '****');

  final List<Message> _messages = [];
  bool _isLoading = false;

  List<Message> get messages => _messages;
  bool get isLoading => _isLoading;

  Future<void> sendMessage(String content) async {
    if (content.trim().isEmpty) return;

    final userMessage = Message(
      content: content,
      isUser: true,
      timestamp: DateTime.now(),
    );

    _messages.add(userMessage);
    notifyListeners();

    _isLoading = true;
    notifyListeners();

    try {
      final response = await _apiService.sendMessage(content);

      final responseMessage = Message(
        content: response,
        isUser: false,
        timestamp: DateTime.now(),
      );

      _messages.add(responseMessage);
    } catch (e) {
      final errorMessage = Message(
        content: 'Error: $e',
        isUser: false,
        timestamp: DateTime.now(),
      );

      _messages.add(errorMessage);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
