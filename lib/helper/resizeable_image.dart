import 'dart:math';

import 'package:flutter/material.dart';

class ResizeableImage extends StatelessWidget {
  final String asset;
  const ResizeableImage({super.key, required this.asset});

  @override
  Widget build(BuildContext context) {
    double deviceWidth(BuildContext context) =>
        MediaQuery.of(context).size.width;
    double deviceHeight(BuildContext context) =>
        MediaQuery.of(context).size.height;
    return SizedBox(
      height: deviceHeight(context) * 0.3,
      width: deviceWidth(context) * 0.3,
      child: GestureDetector(
          onTap: () => showPicFullscreen(context), child: Image.asset(asset)),
    );
  }

  void showPicFullscreen(BuildContext context) async {
    double deviceWidth(BuildContext context) =>
        MediaQuery.of(context).size.width;
    double deviceHeight(BuildContext context) =>
        MediaQuery.of(context).size.height;
    return await showDialog(
      context: context,
      builder: (BuildContext context) => Dialog(
        child: SizedBox(
          height:
              // this doesn't work it reds out becaue the .height property is null. can't figure out how to get the image's height and width to compare to the screen width
              min(deviceHeight(context) * 0.975, Image.asset(asset).height!),
          width: deviceWidth(context) * 0.975,
          child: Stack(
            alignment: AlignmentDirectional.topEnd,
            children: <Widget>[
              Center(
                  child: InteractiveViewer(
                      child: Image.asset(asset, fit: BoxFit.cover))),
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.close,
                  size: 30.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
