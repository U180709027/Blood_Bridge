import 'package:blood_bridge/ConversationScreen.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'MESSAGES',
          style: TextStyle(
            color: Colors.white,
            fontSize: 40,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 60, 152, 192),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              itemCount: 10,
              separatorBuilder: (BuildContext context, int index) =>
                  Divider(color: Color.fromARGB(255, 60, 152, 192)),
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text('User ${index + 1}'),
                  subtitle: Text('Message ${index + 1}'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              ConversationScreen(user: 'User ${index + 1}')),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
        backgroundColor: const Color.fromARGB(255, 60, 152, 192),
        foregroundColor: Colors.white,
      ),
    );
  }
}
