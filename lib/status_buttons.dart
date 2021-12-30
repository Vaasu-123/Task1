import 'package:flutter/material.dart';

Padding activityButtons(BuildContext context, String status, String addStatus, Function addStatusUpdate, Function followStatusUpdate, Function messagePerson) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 0.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        //add
        SizedBox(
          width: MediaQuery.of(context).size.width / 4,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: const Color.fromRGBO(93, 63, 211, 1),
            ),
            onPressed: () => addStatusUpdate(),
            child: Text(
              addStatus.toString(),
            ),
          ),
        ),

        //follow
        SizedBox(
          width: MediaQuery.of(context).size.width / 4,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: const Color.fromRGBO(223, 0, 254, 1),
            ),
            onPressed: () => followStatusUpdate(),
            child: Text(status),
          ),
        ),

        //message
        SizedBox(
          width: MediaQuery.of(context).size.width / 4,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: const Color.fromRGBO(80, 200, 120, 1),
            ),
            onPressed: () => messagePerson(),
            child: const Text("Message"),
          ),
        ),
      ],
    ),
  );
}
