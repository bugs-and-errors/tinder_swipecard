import 'package:flutter/material.dart';
import 'package:tinder_swipecard/tinder_swipecard.dart';
import 'package:tinder_swipecard_example/profiles.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: TinderSwipeCard(
          demoProfiles: demoProfiles,
          myCallback: (decision) {},
          onLike: () {
            print("Liked Profile");
          },
          onDislike: () {
            print("Disliked Profile");
          },
          onSuperLike: () {
            print("Superliked profile");
          },
          onRefresh: () {
            print("Refreshed profiles");
          },
        ),
      ),
    );
  }
}

//dummy data
final List<Profile> demoProfiles = [
  Profile(
    photos: [
      "https://unsplash.com/photos/JVZTtdybC8s/download?force=true&w=640",
      "https://unsplash.com/photos/0oRefidSNKc/download?force=true&w=640",
      "https://unsplash.com/photos/MQ9U2GFnnDc/download?force=true&w=640",
    ],
    name: "Daenerys Targaryen",
    bio:
        "Do you believe in love at first sight – or should you swipe right again?",
  ),
  Profile(
    photos: [
      "https://unsplash.com/photos/bYzllm-pD1k/download?force=true&w=640",
      "https://unsplash.com/photos/UrYLlff6U60/download?force=true&w=640",
    ],
    name: "Sansa Stark",
    bio: "Last time I was someone’s type, I was donating blood.",
  ),
  Profile(
    photos: [
      "https://unsplash.com/photos/pvWvjHdX8O0/download?force=true&w=640",
      "https://unsplash.com/photos/p5SXRTjaPTc/download?force=true&w=640",
    ],
    name: "Margaery Tyrell",
    bio:
        "I’d tell you a lengthy description about myself but that would take away from the mystery.",
  ),
];
