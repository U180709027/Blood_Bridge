import 'package:flutter/material.dart';

class ConversationScreen extends StatelessWidget {
  final String user;

  const ConversationScreen({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(user),
        backgroundColor: const Color.fromARGB(255, 60, 152, 192),
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Text(''),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Type a message...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    // Mesajı gönderme işlemleri burada gerçekleştirilebilir
                  },
                  icon: Icon(Icons.send),
                  color: const Color.fromARGB(255, 60, 152, 192),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
