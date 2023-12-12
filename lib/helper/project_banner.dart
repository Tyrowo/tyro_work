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

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (hovered) {
        if (state != 'open') {
          setState(() {
            state = 'hovered';
          });
        }
      },
      onExit: (notHovered) {
        if (state == 'hovered') {
          setState(() {
            state = 'closed';
          });
        }
      },
      child: GestureDetector(
        onTap: () {
          if (state == 'closed' || state == 'hovered') {
            setState(() {
              state = 'open';
              curHeight = deviceHeight(context) * 0.8;
            });
          } else {
            setState(() {
              state = 'closed';
              curHeight = deviceWidth(context) < 1000 ? 50 : 150;
            });
          }
        },
        child: ClipRRect(
          borderRadius: deviceWidth(context) < 1000
              ? BorderRadius.circular(50.0)
              : BorderRadius.circular(100.0),
          child: AnimatedContainer(
            color: state == 'open'
                ? Theme.of(context).primaryColor
                : const Color.fromRGBO(0, 0, 0, 0),
            duration: const Duration(milliseconds: 200),
            width: deviceWidth(context),
            height: state == 'closed' || state == 'hovered'
                ? deviceWidth(context) < 1000
                    ? 50
                    : 150
                : deviceHeight(context) * 0.9,
            // if the screen is bigger than 600 it's probably not mobile, so we can use the varying padding to create a hover effect when the device is not closed
            padding: state == 'closed' && deviceWidth(context) >= 600
                ? EdgeInsets.fromLTRB(
                    deviceWidth(context) * 0.05,
                    deviceHeight(context) * 0.0,
                    deviceWidth(context) * 0.05,
                    deviceHeight(context) * 0.0)
                : EdgeInsets.fromLTRB(
                    deviceWidth(context) * 0.01,
                    deviceHeight(context) * 0.0,
                    deviceWidth(context) * 0.01,
                    deviceHeight(context) * 0.0,
                  ),
            child: state == 'open'
                ?
                // if open then we return an image and then the article
                Column(
                    children: [
                      FractionallySizedBox(
                        heightFactor: null,
                        widthFactor: 0.9,
                        child: Image.asset(
                          deviceWidth(context) < 1000
                              ? widget.smallBanner
                              : widget.largeBanner,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(
                              deviceWidth(context) * 0.05,
                              deviceHeight(context) * 0.025,
                              deviceWidth(context) * 0.05,
                              deviceHeight(context) * 0.025),
                          child:
                              SingleChildScrollView(child: widget.description),
                        ),
                      ),
                    ],
                  )
                : FractionallySizedBox(
                    heightFactor: null,
                    widthFactor: 0.9,
                    child: Image.asset(
                      deviceWidth(context) < 1000
                          ? widget.smallBanner
                          : widget.largeBanner,
                      fit: BoxFit.cover,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
