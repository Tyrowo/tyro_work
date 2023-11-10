import 'package:flutter/material.dart';

// the goal of this class is to create an animated size container that has three states:
// default it should sit around, on hover it should expand a little and be opaque, and ontap
// it should expand to the full size of the screen and lock in the opacity
class ThoughtPieces extends StatefulWidget {
  final String previewText;
  final Widget article;
  const ThoughtPieces(
      {super.key, required this.previewText, required this.article});

  @override
  State<ThoughtPieces> createState() => _ThoughtPiecesState();
}

class _ThoughtPiecesState extends State<ThoughtPieces> {
  double deviceWidth(BuildContext context) => MediaQuery.of(context).size.width;
  double deviceHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;
  double curHeight = 200.0;
  double curWidth = 400.0;
  bool selected = false;
  bool opaque = false; // placeholder color until initstate can refer to theme

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (hovered) {
        if (curHeight == 200 && curWidth == 400) {
          setState(() {
            curHeight = 225;
            curWidth = 425;
            opaque = true;
          });
        }
      },
      onExit: (notHovered) {
        if (curHeight == 225 && curWidth == 425) {
          setState(() {
            curHeight = 200;
            curWidth = 400;
            opaque = false;
          });
        }
      },
      child: GestureDetector(
        onTap: () {
          if (curHeight == 225.0 && curWidth == 425.0) {
            setState(() {
              curHeight = deviceHeight(context) * 0.95;
              curWidth = deviceWidth(context) * 0.95;
              selected = true;
              opaque = true;
            });
          } else {
            setState(() {
              curHeight = 200.0;
              curWidth = 400.0;
              selected = false;
              opaque = false;
            });
          }
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(40.0),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: curWidth,
            height: curHeight,
            padding: selected
                ? EdgeInsets.fromLTRB(
                    deviceWidth(context) * 0.03,
                    deviceHeight(context) * 0.05,
                    deviceWidth(context) * 0.03,
                    deviceHeight(context) * 0.05)
                : EdgeInsets.fromLTRB(
                    curWidth * 0.15,
                    curHeight * 0.15,
                    curWidth * 0.15,
                    curHeight * 0.15,
                  ),
            color: opaque
                ? Theme.of(context).primaryColor
                : Theme.of(context).cardTheme.color,
            child: SingleChildScrollView(
              child: selected
                  ? widget.article
                  : Text(
                      widget.previewText,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
