import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:bubble/bubble.dart';

final socketHost = 'http://192.168.96.147:3000/';

IO.Socket connectSocket() {
  IO.Socket socket = IO.io(socketHost, <String, dynamic>{
    'transports': ['websocket', 'polling'],
    'upgrade': false,
  });

  socket.connect();
  socket.emit('connection');
  socket.onConnect((_) {
    print('connect');
  });

  return socket;
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  IO.Socket? socket;
  String _message = '';
  List<String> _messages = [];
  HomeScreenState() {
    socket = connectSocket();
    listenSocketEvent();
  }

  void listenSocketEvent() {
    socket?.on('newMessage', (data) => addMessage(data));
  }

  void addMessage(String message) {
    setState(() {
      print('msg ${message}');
      _messages.add(message as String);
    });
  }

  @override
  void dispose() {
    socket?.disconnect();
    super.dispose();
  }

  void sendMessage(String message) {
    socket?.emit('sendMessage', message);
    addMessage(message);
  }

  _buildMessageComposer() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      height: 70.0,
      child: Row(
        children: <Widget>[
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.emoji_emotions_outlined,
                  color: Theme.of(context).primaryColor)),
          Expanded(child: TextField()),
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.send, color: Theme.of(context).primaryColor)),
          // TextField(),
        ],
      ),
    );
  }

  Bubble createBubbleMessage(String message, int index) {
    final isPair = index % 2 == 0;
    return Bubble(
      margin: BubbleEdges.only(top: 10),
      alignment: isPair ? Alignment.topLeft : Alignment.topRight,
      nip: isPair ? BubbleNip.leftTop : BubbleNip.rightTop,
      child:
          Text(message, textAlign: isPair ? TextAlign.left : TextAlign.right),
      color: Color.fromRGBO(212, 234, 244, 1.0),
    );
  }

  @override
  Widget build(BuildContext context) {
    final pseudo = ModalRoute.of(context)!.settings.arguments as String;
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
            title: Text(pseudo),
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.logout),
            )),
        resizeToAvoidBottomInset: true,
        body: Column(
          children: [
            Expanded(
                child: ListView.separated(
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(),
                    itemCount: _messages.length,
                    itemBuilder: (BuildContext context, int index) {
                      return createBubbleMessage(_messages[index], index);
                    })),
            _buildMessageComposer(),
          ],
        ),
      ),
    );
  }
}
