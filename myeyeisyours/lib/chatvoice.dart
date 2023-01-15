import 'dart:developer';

import 'package:chat_package/chat_package.dart';
import 'package:chat_package/models/chat_message.dart';
import 'package:chat_package/models/media/chat_media.dart';
import 'package:chat_package/models/media/media_type.dart';
import 'package:flutter/material.dart';



class chatvoice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'chat',
      home:  Scaffold(
         appBar: AppBar(title: const Text('chat'), centerTitle: true),
        body:Chatvocal(),
      ),
    );
  }
}

class Chatvocal extends StatefulWidget {
  Chatvocal({Key? key}) : super(key: key);

  @override
  _ChatvocalState createState() => _ChatvocalState();
}

class _ChatvocalState extends State<Chatvocal> {
  List<ChatMessage> messages = [
    /*ChatMessage(
      isSender: true,
      text: 'this is a banana',
      chatMedia: ChatMedia(
        url:
            'https://images.pexels.com/photos/7194915/pexels-photo-7194915.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260',
        mediaType: MediaType.imageMediaType(),
      ),
    ),*/
    ChatMessage(
      isSender: false,
      chatMedia: ChatMedia(
        url:
            '../assets/images/person.jpg',
        mediaType: MediaType.imageMediaType(),
      ),
    ),
   // ChatMessage(isSender: false, text: 'wow that is cool'),
  ];
  final scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChatScreen(
        
        scrollController: scrollController,
        messages: messages,
        onSlideToCancelRecord: () {
          log('not sent');
        },
        onTextSubmit: (textMessage) {
          setState(() {
            messages.add(textMessage);

            scrollController
                .jumpTo(scrollController.position.maxScrollExtent + 50);
          });
        },
        handleRecord: (audioMessage, canceled) {
          if (!canceled) {
            setState(() {

              messages.add(audioMessage!);
              scrollController
                  .jumpTo(scrollController.position.maxScrollExtent + 190);
            });
          }
        },
        handleImageSelect: (imageMessage) async {
          if (imageMessage != null) {
            setState(() {
              messages.add(
                imageMessage,
              );
              scrollController
                  .jumpTo(scrollController.position.maxScrollExtent + 300);
            });
          }
        },
      ),
    );
  }
}