import 'package:flutter/material.dart';

// the goal of this class is to create an animated size container that has three states:
// default it should sit around, on hover it should expand a little and be opaque, and ontap
// it should expand to the full size of the screen and lock in the opacity
class ThoughtPieces extends StatefulWidget {
  final String previewText;
  final String articleText;
  const ThoughtPieces(
      {super.key, required this.previewText, required this.articleText});

  @override
  State<ThoughtPieces> createState() => _ThoughtPiecesState();
}

class _ThoughtPiecesState extends State<ThoughtPieces> {
  double deviceWidth(BuildContext context) => MediaQuery.of(context).size.width;
  double deviceHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;
  double curHeight = 200.0;
  double curWidth = 400.0;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (hovered) {
        if (curHeight == 200 && curWidth == 400) {
          setState(() {
            curHeight = 250;
            curWidth = 450;
          });
        }
      },
      onExit: (notHovered) {
        if (curHeight == 250 && curWidth == 450) {
          setState(() {
            curHeight = 200;
            curWidth = 400;
          });
        }
      },
      child: GestureDetector(
        onTap: () {
          if (curHeight == 250.0 && curWidth == 450.0) {
            setState(() {
              curHeight = deviceHeight(context) * 0.95;
              curWidth = deviceWidth(context) * 0.95;
            });
          } else {
            setState(() {
              curHeight = 200.0;
              curWidth = 400.0;
            });
          }
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: curWidth,
          height: curHeight,
          child: Card(
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                  deviceWidth(context) * 0.01,
                  deviceHeight(context) * 0.01,
                  deviceWidth(context) * 0.01,
                  deviceHeight(context) * 0.01),
              child: Text(widget.previewText),
            ),
          ),
        ),
      ),
    );
  }
}
