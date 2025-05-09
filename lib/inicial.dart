import 'package:flutter/material.dart';

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
            builder: (_) => ChatScreen(name: args['name']!),
          );
        }
        return null;
      },
    );
  }
}

class ChatListScreen extends StatelessWidget {
  final List<Map<String, String>> users = [
    {
      "name": "Justin O'Moore",
      "message": "Hey there! What’s up? Is everything...",
      "time": "18:32",
      "avatarUrl":
          "https://raw.githubusercontent.com/Rea2er/flutter-message-chat-app-starter/refs/heads/main/assets/images/user0.png",
    },
    {
      "name": "Alaya Cordova",
      "message": "Can I call you back later? I'm in a...",
      "time": "14:05",
      "avatarUrl":
          "https://raw.githubusercontent.com/Rea2er/flutter-message-chat-app-starter/refs/heads/main/assets/images/user1.png",
    },
    {
      "name": "Eathan Sheridan",
      "message": "Yeah. Do you have any good song...",
      "time": "14:00",
      "avatarUrl":
          "https://raw.githubusercontent.com/Rea2er/flutter-message-chat-app-starter/refs/heads/main/assets/images/user2.png",
    },
    {
      "name": "Cecily Trujillo",
      "message": "Hi! I went shopping today and fou...",
      "time": "13:35",
      "avatarUrl":
          "https://raw.githubusercontent.com/Rea2er/flutter-message-chat-app-starter/refs/heads/main/assets/images/user4.png",
    },
    {
      "name": "Komal Orr",
      "message": "I passed you on the ride into work...",
      "time": "12:11",
      "avatarUrl":
          "https://raw.githubusercontent.com/Rea2er/flutter-message-chat-app-starter/refs/heads/main/assets/images/user5.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2F2F2),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(20, 60, 20, 20),
            decoration: BoxDecoration(
              color: Color(0xFF5C4DB1),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Chat with\nyour friends",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                CircleAvatar(
                  backgroundColor: Colors.white24,
                  child: Icon(Icons.search, color: Colors.white),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(16),
              itemCount: users.length,
              itemBuilder: (context, index) {
                var user = users[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      '/chat',
                      arguments: {'name': user['name']!},
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.only(bottom: 16),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 25,
                          backgroundImage: NetworkImage(user['avatarUrl']!),
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                user['name']!,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                user['message']!,
                                style: TextStyle(
                                  color: Colors.grey[700],
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                        Text(
                          user['time']!,
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class ChatScreen extends StatelessWidget {
  final String name;

  ChatScreen({required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2F2F2),
      appBar: AppBar(
        title: Text(name),
        backgroundColor: Color(0xFF5C4DB1),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(16),
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: ChatBubble(
                    text: "Hey there! What's up?",
                    time: "18:35",
                    isMe: false,
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: ChatBubble(
                    text:
                        "Nothing. Just chilling and watching YouTube. What about you?",
                    time: "18:36",
                    isMe: true,
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: ChatBubble(
                    text:
                        "Same here! Been watching YouTube for the past 5 hours despite of having so much to do! 😅",
                    time: "18:39",
                    isMe: false,
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: ChatBubble(
                    text: "It's hard to be productive, man 😔",
                    time: "18:39",
                    isMe: false,
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: ChatBubble(
                    text: "Yeah I know. I'm in the same position 😂",
                    time: "18:42",
                    isMe: true,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Type your message...",
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 16.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                CircleAvatar(
                  backgroundColor: Color(0xFF5C4DB1),
                  child: Icon(Icons.send, color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ChatBubble extends StatelessWidget {
  final String text;
  final String time;
  final bool isMe;

  const ChatBubble({
    required this.text,
    required this.time,
    required this.isMe,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isMe ? Color(0xFFDAD4F2) : Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: TextStyle(fontSize: 15),
          ),
          SizedBox(height: 4),
          Text(
            time,
            style: TextStyle(fontSize: 11, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
