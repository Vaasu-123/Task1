import 'package:flutter/material.dart';
import 'package:task_profile/avatar.dart';
import 'package:task_profile/main.dart';
import 'dart:math' as math;

//import 'chat_ui.dart';
void main() => runApp(ChatInterface());

class ChatInterface extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/mainScreen": (context) => const MyApp(),
      },
      title: 'Profile',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Avenir Next',
      ),
      home: MyChatInterface(),
    );
  }
}

class MyChatInterface extends StatefulWidget {
  @override
  State<MyChatInterface> createState() => _MyChatInterfaceState();
}

class _MyChatInterfaceState extends State<MyChatInterface> {
  List<String> chat = ["Hi! There", "1", "2"];
  void updateChat(String currentChat) {
    setState(() {
      chat.add(currentChat);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/Images/Background2.jpeg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: const Color.fromRGBO(255, 255, 255, 0.7),
          appBar: AppBar(
            backgroundColor: const Color.fromRGBO(80, 200, 120, 0.7),
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pushNamed(context, "/mainScreen");
              },
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: circularAvatar(10),
                ),
                const Text(
                  'Mr. Cute',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            elevation: 0,
            actions: const <Widget>[
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Icon(
                  Icons.call,
                  color: Colors.black,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Icon(
                  Icons.videocam_rounded,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          body: Column(
            //mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  bottom: (MediaQuery.of(context).size.height / 40),
                  left: 10.0,
                  right: 10.0,
                ),
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    color: Color.fromRGBO(80, 200, 120, 1),
                  ),
                  //height: 40,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(right: 8.0),
                          child: Icon(
                            Icons.emoji_emotions,
                            color: Colors.white,
                          ),
                        ),
                        const Flexible(
                          child: TextField(
                            autofocus: true,
                            style: TextStyle(
                              color: Colors.white,
                            ),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Message",
                              hintStyle: TextStyle(
                                color: Colors.white,
                                //fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Transform.rotate(
                          angle: 135 * math.pi / 180,
                          child: const Icon(
                            Icons.attachment_sharp,
                            color: Colors.white,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.send,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
