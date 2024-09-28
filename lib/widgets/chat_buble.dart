import 'package:chat_app/model/message_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class ChatBuble extends StatefulWidget {
  const ChatBuble({super.key, required this.message, required this.docsId});
  final Message message;
  final String docsId;

  @override
  State<ChatBuble> createState() => _ChatBubleState();
}

class _ChatBubleState extends State<ChatBuble> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () async {
        await FirebaseFirestore.instance
            .collection(kMessageColection)
            .doc(widget.docsId)
            .delete();
        setState(() {});
      },
      child: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
          decoration: const BoxDecoration(
            color: kPraimaryColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
                bottomRight: Radius.circular(30)),
          ),
          child: Text(
            widget.message.message,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

class ChatFriendBuble extends StatelessWidget {
  const ChatFriendBuble({super.key, required this.message});
  final Message message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
        decoration: const BoxDecoration(
          color: Color(0xff006D84),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
              bottomLeft: Radius.circular(30)),
        ),
        child: Text(
          message.message,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
