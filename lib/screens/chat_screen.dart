import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../constants.dart';
import '../model/message_model.dart';
import '../widgets/chat_buble.dart';
import '../widgets/custom_chat_text_field.dart';

class ChatScreen extends StatelessWidget {
  static String id = 'ChatScreen';
  final TextEditingController messageEdittingController =
      TextEditingController();
  final CollectionReference messagesRef =
      FirebaseFirestore.instance.collection(kMessageColection);
  final scrollcontroller = ScrollController();

  ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var userEmail = ModalRoute.of(context)!.settings.arguments;
    return StreamBuilder<QuerySnapshot>(
      stream: messagesRef.orderBy(kCreatedAt, descending: true).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          // print(snapshot.data!.docs[1][kMessage]);
          List<Message> messagesList = [];
          for (int i = 0; i < snapshot.data!.docs.length; i++) {
            messagesList.add(Message.fromJson(snapshot.data!.docs[i]));
          }
          return Scaffold(
            appBar: AppBar(
                // centerTitle: true,
                automaticallyImplyLeading: false,
                backgroundColor: kPraimaryColor,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      kLogo,
                      height: 50,
                    ),
                    const Text('Chat', style: TextStyle(color: Colors.white))
                  ],
                )),
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      reverse: true,
                      controller: scrollcontroller,
                      itemCount: messagesList.length,
                      itemBuilder: (context, index) {
                        return messagesList[index].id == userEmail
                            ? ChatBuble(
                                message: messagesList[index],
                                docsId: messagesList[index].id,
                              )
                            : ChatFriendBuble(message: messagesList[index]);
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: CustomTextFoemField(
                    messageEdittingController: messageEdittingController,
                    messagesRef: messagesRef,
                    userEmail: userEmail,
                    scrollcontroller: scrollcontroller,
                  ),
                ),
              ],
            ),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
