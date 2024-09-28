import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class CustomTextFoemField extends StatelessWidget {
  const CustomTextFoemField({
    super.key,
    required this.messageEdittingController,
    required this.messagesRef,
    required this.userEmail,
    required this.scrollcontroller,
  });

  final TextEditingController messageEdittingController;
  final CollectionReference<Object?> messagesRef;
  final Object? userEmail;
  final ScrollController scrollcontroller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: messageEdittingController,
      onSubmitted: (value) {
        messagesRef.add(
            {kMessage: value, kCreatedAt: DateTime.now(), 'id': userEmail});

        messageEdittingController.clear();
        scrollcontroller.animateTo(
          0,
          duration: const Duration(seconds: 1),
          curve: Curves.fastOutSlowIn,
        );
      },
      decoration: InputDecoration(
          hintText: 'Send a Message...',
          suffixIcon: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.send,
              color: kPraimaryColor,
            ),
          ),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            borderSide: BorderSide(
              color: kPraimaryColor,
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: kPraimaryColor, width: 1),
            borderRadius: BorderRadius.all(Radius.circular(30)),
          )),
    );
  }
}
