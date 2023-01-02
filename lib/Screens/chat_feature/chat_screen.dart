import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

import '../colors.dart';
User loggedInUser;
final fireStore = FirebaseFirestore.instance;
class ChatScreen extends StatefulWidget {
  static const String id = 'chat_screen';
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final messageTextController = TextEditingController();
  String message;
  final fireStore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentUser();
  }
  void getCurrentUser()  async{
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
      }
    }
    catch(e){
      print(e);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: [
          IconButton(
              icon: Icon(Icons.close, color: kTextColor,),
              onPressed: () {
                _auth.signOut();
                Navigator.pop(context);
              }),
        ],
        title: Text(loggedInUser.email, style: TextStyle(color: kTextColor),),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              child: Padding(
                padding: const EdgeInsets.only(bottom:60.0),
                child: ListView(
                  reverse: true,
                    children:[
                      MessagesStream(),
                    ]),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width*0.76,
                      height: 50,
                      decoration: BoxDecoration(
                        color: kBackgroundColor,
                        borderRadius: BorderRadius.circular(30),
                      ) ,
                      child: TextField(
                        controller: messageTextController,
                        maxLines: null,
                        decoration: InputDecoration(
                          prefixIcon: GestureDetector(onTap:(){},child: Icon(Icons.person, color: kTextColor,)),
                          hintText: 'Type Message',
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(left: 8, bottom: 10, right: 12, top: 14),
                          suffixIcon: Icon(Icons.camera_alt, color: kTextColor,)
                        ),
                        onChanged: (value) {
                          message = value;
                        },
                      ),
                    ),
                  SizedBox(
                    width: 8,
                  ),
                  GestureDetector(
                      onTap: () {
                       fireStore.collection('messages').add({
                         'text': message,
                         'user': loggedInUser.email,
                       });
                       messageTextController.clear();
                      },
                      child: CircleAvatar(
                        radius: 25,
                        backgroundColor: kSignUpButtonColor,
                        child: Icon(Icons.send, color: Colors.white,),
                      )
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MessagesStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: fireStore.collection('messages').snapshots()  ,
      builder: (context, snapshot){
        if(!snapshot.hasData){
          return Center(
            child: CircularProgressIndicator(),
          );
        }
          final messages = snapshot.data.docs.reversed;
          List<MessageBubble> chats = [];
          for(var chat in messages){
            final userChat = chat['text'];
            final sender = chat['user'];
            final currentUser = loggedInUser.email;
            chats.add(
                MessageBubble(
              text: userChat,
              sender: sender,
              isMe: currentUser==sender,
            ));
          }
          return Column(
            // crossAxisAlignment: isMe.isMe?CrossAxisAlignment.end:CrossAxisAlignment.start,
            children: chats,
          );
        }
      // },
    );
  }
}

class MessageBubble extends StatelessWidget {
  final bool isMe;
  final sender;
  final text;
  MessageBubble({this.text, this.sender, this.isMe});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Align(
        alignment: isMe?Alignment.centerRight:Alignment.centerLeft,
        child: Column(
          crossAxisAlignment:isMe? CrossAxisAlignment.end:CrossAxisAlignment.start,
          children: [
            Text('$sender', style: TextStyle(fontSize: 8, color: Colors.grey),),
            Material(
              elevation: 3,
              borderRadius: isMe? BorderRadius.only(
                  topLeft: Radius.circular(30),
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
              ): BorderRadius.only(
                topRight: Radius.circular(30),
                bottomRight: Radius.circular(30),
                bottomLeft: Radius.circular(30),
              ),
              color: isMe?kLoginButtonColor:kBackgroundColor,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Text('$text',),
                )
            ),
          ],
        ),
      ),
    );
  }
}
