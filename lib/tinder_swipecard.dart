import 'package:flutter/material.dart';

import './cards.dart';
import './matches.dart';

class TinderSwipeCard extends StatefulWidget {
  final String title;
  final List demoProfiles;

  @Deprecated(
      "Use onLike, onDislike, onSuperLike, onRefresh instead. Will be removed in v1.0.0")
  final Function(Decision) myCallback;
  final Function() onLike;
  final Function() onDislike;
  final Function() onSuperLike;
  final Function() onRefresh;

  TinderSwipeCard({
    Key key,
    this.title,
    this.demoProfiles,
    this.myCallback,
    this.onLike,
    this.onDislike,
    this.onSuperLike,
    this.onRefresh,
  }) : super(key: key);

  @override
  _TinderSwipeCardState createState() => _TinderSwipeCardState();
}

class _TinderSwipeCardState extends State<TinderSwipeCard> {
  Match match = new Match();

  Widget _buildBottomBar(MatchEngine matchEngine) {
    return BottomAppBar(
      color: Colors.transparent,
      elevation: 0.0,
      child: Container(
        margin: EdgeInsets.only(bottom: 18.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            RoundIconButton.large(
              icon: Icons.refresh,
              iconColor: Colors.orange,
              onPressed: widget.onRefresh,
            ),
            RoundIconButton.large(
              icon: Icons.clear,
              iconColor: Colors.red,
              onPressed: () {
                if (widget.onDislike == null) {
                  matchEngine.currentMatch.nope();
                  matchEngine.cycleMatch();
                } else {
                  matchEngine.currentMatch.nope();
                  matchEngine.cycleMatch();
                  widget.onDislike();
                }
              },
            ),
            RoundIconButton.large(
              icon: Icons.star,
              iconColor: Colors.blue,
              onPressed: () {
                if (widget.onSuperLike == null) {
                  matchEngine.currentMatch.superLike();
                  matchEngine.cycleMatch();
                } else {
                  matchEngine.currentMatch.superLike();
                  matchEngine.cycleMatch();
                  widget.onSuperLike();
                }
              },
            ),
            RoundIconButton.large(
              icon: Icons.favorite,
              iconColor: Colors.green,
              onPressed: () {
                if (widget.onLike == null) {
                  matchEngine.currentMatch.like();
                  matchEngine.cycleMatch();
                } else {
                  matchEngine.currentMatch.like();
                  matchEngine.cycleMatch();
                  widget.onLike();
                }
              },
            ),
          ],
        ),
      ),
    );
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
          onLike: () {
            matchEngine.currentMatch.like();
            matchEngine.cycleMatch();
            widget.onLike();
          },
          onDislike: () {
            matchEngine.currentMatch.nope();
            matchEngine.cycleMatch();
            widget.onDislike();
          },
          onSuperLike: () {
            matchEngine.currentMatch.superLike();
            matchEngine.cycleMatch();
            widget.onSuperLike();
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
