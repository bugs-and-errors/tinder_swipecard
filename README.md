# tinder_swipecard

This package is a fork of [tinder_card](https://github.com/Aneesh1990/flutter_tinder_card) with the ability to display images from an URL and support for recent versions of Flutter.

## Getting Started

A sample Tinder Card with swipe effects with multiple images showing in a card.

## Demo

![Demo](https://github.com/Aneesh1990/flutter_tinder_card/blob/master/example/assets/ezgif.com-video-to-gif.gif)

*See example for details*

## Usage

Add the package to your `pubspec.yml` file.

```yml
dependencies:
  tinder_swipecard: ^0.1.0
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
Here i'm usind a model class for the data handling
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
  new Profile(
    photos: [
      "https://upload.wikimedia.org/wikipedia/commons/thumb/4/46/Emilia_Clarke_--_Dom_Hemingway_07.jpg/731px-Emilia_Clarke_--_Dom_Hemingway_07.jpg",
      "https://upload.wikimedia.org/wikipedia/commons/5/57/Emilia_Clarke_by_Gage_Skidmore_3.jpg",
    ],
    name: "Daenerys Targaryen",
    bio: "Is your name winter? Because you'll be coming soon.",
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
        demoProfiles: demoProfiles,
        myCallback: (decision) {},
      )),
    );
  }
```





