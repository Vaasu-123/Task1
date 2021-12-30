import 'package:flutter/material.dart';
import 'package:task_profile/message_interface.dart';
import 'avatar.dart';
import 'status_buttons.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/message': (context) => ChatInterface(),
      },
      title: 'Profile',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Avenir Next',
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double avatarRadius = 110;

  int followers = 5290;

  String status = "Follow";

  String addStatus = "Add";

  Future addStatusUpdate() {
    return showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Center(
          child: Text(
            addStatus == "Add"
                ? "User added successfully"
                : "User removed successfully",
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text("Unapprove"),
          ),
          TextButton(
            onPressed: () {
              setState(
                () {
                  addStatus = addStatus == "Add" ? "Added" : "Add";
                },
              );
              Navigator.of(context).pop();
            },
            child: const Text("Approve"),
          ),
        ],
      ),
    );
  }

  void followStatusUpdate() {
    setState(
      () {
        status = status == "Follow" ? "Following" : "Follow";
        if (status == "Follow") {
          followers--;
        } else {
          followers++;
        }
      },
    );
  }

  void messagePerson() {
    Navigator.pushNamed(context, "/message");
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
          backgroundColor: const Color.fromRGBO(255, 255, 255, 0.7),
          appBar: AppBar(
            leading: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            backgroundColor: Colors.transparent,
            title: const Text(
              'Profile',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            elevation: 0,
            actions:  <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: IconButton(
                  icon: const Icon(
                    Icons.message,
                    color: Colors.black,
                  ),
                  onPressed: () => messagePerson(),
                ),
              )
            ],
          ),
          body: Center(
            //Center profile
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 75,
              ),
              child: Container(
                //setting up the center white profile rectangle
                decoration: const BoxDecoration(
                    color: Color.fromRGBO(255, 255, 255, 0.7),
                    shape: BoxShape.rectangle,
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.2),
                        blurRadius: 15.0,
                      ),
                    ],
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                width: double.infinity,
                height: double.infinity,

                //placing the widgets
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 0.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //Circular Avatar
                      circularAvatar(avatarRadius),

                      //ProfileName
                      const Text(
                        "MR. CUTE",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                        ),
                      ),

                      //location
                      Padding(
                        padding: const EdgeInsets.only(bottom: 85.0),
                        child: Text(
                          "United Kingdom",
                          style: TextStyle(color: Colors.purple.shade800),
                        ),
                      ),

                      //data
                      Padding(
                        padding: const EdgeInsets.only(bottom: 50.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            //Followers
                            Column(
                              children: [
                                Text(
                                  followers.toString(),
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Text("Followers")
                              ],
                            ),

                            Column(
                              children: const [
                                Text(
                                  "1260",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text("Following")
                              ],
                            ),

                            Column(
                              children: const [
                                Text(
                                  "290",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text("Posts")
                              ],
                            ),

                            Column(
                              children: const [
                                Text(
                                  "90",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text("Story")
                              ],
                            ),
                          ],
                        ),
                      ),

                      //buttons
                      activityButtons(context, status, addStatus, addStatusUpdate,
                          followStatusUpdate, messagePerson)
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
