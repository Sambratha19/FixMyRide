import 'package:login/presentation/chat_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {

  final _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFc59863),
      appBar: AppBar(backgroundColor: Color(0xFFc59863), title: Text("Welcome to FixMyRide support"),),
      body: SafeArea(
        child: Column(
        children: [
          Expanded(
            child: Consumer<ChatProvider>(
              builder: (context, chatProvider, child) {
                if(chatProvider.messages.isEmpty){
                  return const Center(
                    child: Text("Start convo..."),
                  );
                }

                return ListView.builder(
                  itemCount: chatProvider.messages.length,
                  itemBuilder: (context, index) {
                    // final message = chatProvider.messages[index];
                    // return ListTile(
                    //   title: Text(message.content),
                    // );
                    final message = chatProvider.messages[index];
                    final isUser = message.isUser;

                    return Align(
                      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
                      child: Container(

                        margin: EdgeInsets.symmetric(vertical: 5),
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: isUser ? Color(0xffe4dab0) : Color(0xFF805739),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Text(
                          message.content,
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    );
                  }
                );
              }
            ),
          ),

          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _controller,
                  decoration: const InputDecoration(
                    hintText: "Type a message...",
                  )
                ),
              ),

              IconButton(onPressed: (){
                if(_controller.text.isNotEmpty){
                  final chatProvider=context.read<ChatProvider>();
                  chatProvider.sendMessage(_controller.text);
                  _controller.clear();
                }
              },
                  icon: const Icon(Icons.send),
              )
            ],
          )
        ],
      ),
      ),
    );
  }
}
