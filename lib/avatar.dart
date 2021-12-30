// ignore_for_file: file_names

import 'package:flutter/material.dart';

Padding circularAvatar(double avatarRadius) {
    return Padding(
                    padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          colors: [
                            Color.fromRGBO(57, 255, 20, 1),
                            Color.fromRGBO(255, 16, 240, 1),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                      child: CircleAvatar(
                        radius: (avatarRadius + 5),
                        backgroundColor:
                            const Color.fromRGBO(255, 255, 255, 1),
                        child: CircleAvatar(
                          radius: avatarRadius,
                          backgroundImage: const AssetImage(
                              "assets/Images/Profile_Image.jpeg"),
                        ),
                      ),
                    ),
                  );
  }
