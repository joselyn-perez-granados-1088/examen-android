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
      home: ChatListScreen(),
    );
  }
}

class ChatListScreen extends StatelessWidget {
  final List<Map<String, String>> users = [
    {
      "name": "Tannaz Sadeghi",
      "message": "Hey there! What’s up?",
      "time": "18:32",
      "avatar": "https://i.pravatar.cc/150?img=10"
    },
    {
      "name": "Justin O'Moore",
      "message": "Hey there! What’s up? Is everything...",
      "time": "18:32",
      "avatar": "https://i.pravatar.cc/150?img=20"
    },
    {
      "name": "Alaya Cordova",
      "message": "Can I call you back later? I'm in a...",
      "time": "14:05",
      "avatar": "https://i.pravatar.cc/150?img=30"
    },
    {
      "name": "Eathan Sheridan",
      "message": "Yeah. Do you have any good song...",
      "time": "14:00",
      "avatar": "https://i.pravatar.cc/150?img=40"
    },
    {
      "name": "Cecily Trujillo",
      "message": "Hi! I went shopping today and fou...",
      "time": "13:35",
      "avatar": "https://i.pravatar.cc/150?img=50"
    },
    {
      "name": "Komal Orr",
      "message": "I passed you on the ride into work...",
      "time": "12:11",
      "avatar": "https://i.pravatar.cc/150?img=60"
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ChatScreen(
                          name: user['name']!,
                          avatar: user['avatar']!,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.only(bottom: 16),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 25,
                          backgroundImage: NetworkImage(user['avatar']!),
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
  final String avatar;

  ChatScreen({required this.name, required this.avatar});

  final String myAvatar =
      "https://raw.githubusercontent.com/Rea2er/flutter-message-chat-app-starter/refs/heads/main/assets/images/user6.png";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2F2F2),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Color(0xFF5C4DB1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
          title: Padding(
            padding: const EdgeInsets.only(top: 24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Text("Back", style: TextStyle(color: Colors.white)),
                ),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 18,
                      backgroundImage: NetworkImage(avatar),
                    ),
                    SizedBox(width: 8),
                    Text(
                      name,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.call, color: Colors.white),
                    SizedBox(width: 10),
                    Icon(Icons.video_call, color: Colors.white),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(16),
              children: [
                buildMessage("Hey there! What’s up? Is everything going well?",
                    false, "18:35", avatar),
                buildMessage(
                    "Nothing. Just chilling and watching YouTube. What about you?",
                    true,
                    "18:36",
                    myAvatar),
                buildMessage(
                    "Same here! Been watching YouTube for the past 5 hours despite of having so much to do! 😅",
                    false,
                    "18:39",
                    avatar),
                buildMessage("It’s hard to be productive, man 😔", false,
                    "18:39", avatar),
                buildMessage("Yeah I know. I’m in the same position 😂", true,
                    "18:42", myAvatar),
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

  Widget buildMessage(String text, bool isMe, String time, String avatarUrl) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Align(
        alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
        child: Row(
          mainAxisAlignment:
              isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (!isMe)
              CircleAvatar(
                radius: 18,
                backgroundImage: NetworkImage(avatarUrl),
              ),
            if (!isMe) SizedBox(width: 6),
            Flexible(
              child: Container(
                constraints: BoxConstraints(maxWidth: 250),
                padding: EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: isMe ? Color(0xFFDAD4F2) : Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment:
                      isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                  children: [
                    Text(text, style: TextStyle(fontSize: 15)),
                    SizedBox(height: 6),
                    Text(time,
                        style: TextStyle(fontSize: 11, color: Colors.grey)),
                  ],
                ),
              ),
            ),
            if (isMe) SizedBox(width: 6),
            if (isMe)
              CircleAvatar(
                radius: 18,
                backgroundImage: NetworkImage(avatarUrl),
              ),
          ],
        ),
      ),
    );
  }
}
