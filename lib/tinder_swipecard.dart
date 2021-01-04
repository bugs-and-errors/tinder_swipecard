import 'package:flutter/material.dart';

import './cards.dart';
import './matches.dart';

class TinderSwipeCard extends StatefulWidget {
  TinderSwipeCard({
    Key key,
    this.title,
    this.demoProfiles,
    this.myCallback,
  }) : super(key: key);

  final String title;
  final List demoProfiles;

  final Function(Decision) myCallback;

  @override
  _TinderSwipeCardState createState() => _TinderSwipeCardState();
}

class _TinderSwipeCardState extends State<TinderSwipeCard> {
  Match match = new Match();

  Widget _buildBottomBar(MatchEngine matchEngine) {
    return BottomAppBar(
        color: Colors.transparent,
        elevation: 0.0,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              RoundIconButton.small(
                icon: Icons.refresh,
                iconColor: Colors.orange,
                onPressed: () {},
              ),
              RoundIconButton.large(
                icon: Icons.clear,
                iconColor: Colors.red,
                onPressed: () {
                  matchEngine.currentMatch.nope();
                  matchEngine.cycleMatch();
                },
              ),
              RoundIconButton.small(
                icon: Icons.star,
                iconColor: Colors.blue,
                onPressed: () {
                  matchEngine.currentMatch.superLike();
                  matchEngine.cycleMatch();
                },
              ),
              RoundIconButton.large(
                icon: Icons.favorite,
                iconColor: Colors.green,
                onPressed: () {
                  matchEngine.currentMatch.like();
                  matchEngine.cycleMatch();
                },
              ),
              RoundIconButton.small(
                icon: Icons.lock,
                iconColor: Colors.purple,
                onPressed: () {},
              ),
            ],
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    final MatchEngine matchEngine = new MatchEngine(
        matches: widget.demoProfiles.map((final profile) {
      return Match(profile: profile);
    }).toList());

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: CardStack(
          matchEngine: matchEngine,
          onSwipeCallback: (match) {
            widget.myCallback(match);
          },
        ),
      ),
      bottomNavigationBar: _buildBottomBar(matchEngine),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final double size;
  final VoidCallback onPressed;

  RoundIconButton.large({
    this.icon,
    this.iconColor,
    this.onPressed,
  }) : size = 60.0;

  RoundIconButton.small({
    this.icon,
    this.iconColor,
    this.onPressed,
  }) : size = 50.0;

  RoundIconButton({
    this.icon,
    this.iconColor,
    this.size,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: Color(0x11000000), blurRadius: 10.0),
          ]),
      child: RawMaterialButton(
        shape: CircleBorder(),
        elevation: 0.0,
        child: Icon(
          icon,
          color: iconColor,
        ),
        onPressed: onPressed,
      ),
    );
  }
}
