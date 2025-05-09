import 'package:flutter/material.dart';

import 'inicial.dart';

void main() {
  runApp(ChatApp());
}

class ChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat UI',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => ChatListScreen(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/chat') {
          final args = settings.arguments as Map<String, String>;
          return MaterialPageRoute(
            builder: (context) => ChatScreen(name: args['name']!),
          );
        }
        return null;
      },
    );
  }
}
