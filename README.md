# tinder_swipecard

This package is a fork of [tinder_card](https://github.com/Aneesh1990/flutter_tinder_card) with the ability to display images from URLs and support for the recent versions of Flutter.

## Getting Started

A sample Tinder Card with swipe effects with multiple images showing in a card.

## Demo

![Demo](https://github.com/bugs-and-errors/tinder_swipecard/blob/main/example/assets/demo.mp4)

*See example for details*

## Usage

Add the package to your `pubspec.yaml` file.

```yml
dependencies:
  tinder_swipecard: ^0.3.0
```

## Install it

You can install packages from the command line:

with Flutter:

```dart
$ flutter pub get
```

Alternatively, your editor might support flutter pub get. Check the docs for your editor to learn more.

# Import it

Now in your Dart code, you can use:

```dart
'import 'package:tinder_swipecard/tinder_swipecard.dart';
```

## How to pass the card data

Here we are using a common data structure for the card detail
```dart

class Profile {
  final List<String> photos;
  final String name;
  final String bio;

  Profile({this.photos, this.name, this.bio});
}
```
adding some dummy data to the Profile model
```dart
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

```

### Show the tinder card in the Scaffold 

```dart
@override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: TinderSwipeCard(
        profiles: demoProfiles,
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
```





