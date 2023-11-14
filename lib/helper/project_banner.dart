import 'package:flutter/material.dart';

class ProjectBanner extends StatefulWidget {
  final String largeBanner;
  final String smallBanner;
  final Widget description;
  final int index;
  const ProjectBanner(
      {super.key,
      required this.largeBanner,
      required this.smallBanner,
      required this.description,
      required this.index});

  @override
  State<ProjectBanner> createState() => _ProjectBannerState();
}

class _ProjectBannerState extends State<ProjectBanner> {
  double deviceWidth(BuildContext context) => MediaQuery.of(context).size.width;
  double deviceHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;
  double curHeight = 150.0;
  double curWidth = 1080.0;
  String state = 'closed'; // closed, hovered, open
  bool opaque = false; // placeholder color until initstate can refer to theme
  double outerPaddingHeight = 20;
  double outerPaddingWidth = 20;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (hovered) {
        if (state != 'open') {
          setState(() {
            state = 'hovered';
            // reduce outer padding, maybe make it colored?
            opaque = true;
          });
        }
      },
      onExit: (notHovered) {
        if (state == 'hovered') {
          setState(() {
            state = 'closed';
            // increase outer padding, return color back
            opaque = false;
          });
        }
      },
      child: GestureDetector(
        onTap: () {
          if (state == 'hovered') {
            setState(() {
              state = 'open';
              curHeight = deviceHeight(context) * 0.8;
              opaque = true;
            });
          } else {
            setState(() {
              state = 'closed';
              curHeight = deviceWidth(context) < 700 ? 50 : 150;
              opaque = false;
            });
          }
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: deviceWidth(context),
          height: state == 'closed' || state == 'hovered'
              ? deviceWidth(context) < 700
                  ? 50
                  : 150
              : deviceHeight(context) * 0.8,
          padding: state == 'closed'
              ? EdgeInsets.fromLTRB(
                  deviceWidth(context) * 0.1,
                  deviceHeight(context) * 0.0,
                  deviceWidth(context) * 0.1,
                  deviceHeight(context) * 0.0)
              : EdgeInsets.fromLTRB(
                  deviceWidth(context) * 0.05,
                  deviceHeight(context) * 0.0,
                  deviceWidth(context) * 0.05,
                  deviceHeight(context) * 0.0,
                ),
          // color: opaque
          //     ? Theme.of(context).primaryColor
          //     : Theme.of(context).cardTheme.color,
          child: state == 'open'
              ?
              // if open then we return an image and then the article
              Column(
                  children: [
                    FractionallySizedBox(
                      heightFactor: null,
                      widthFactor: 0.9,
                      child: Image.asset(
                        deviceWidth(context) < 600
                            ? widget.smallBanner
                            : widget.largeBanner,
                        fit: BoxFit.fill,
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Expanded(
                        child: SingleChildScrollView(child: widget.description),
                      ),
                    ),
                  ],
                )
              : FractionallySizedBox(
                  heightFactor: null,
                  widthFactor: 0.9,
                  child: Image.asset(
                    deviceWidth(context) < 600
                        ? widget.smallBanner
                        : widget.largeBanner,
                    fit: BoxFit.cover,
                  ),
                ),
        ),
      ),
    );
  }
}
