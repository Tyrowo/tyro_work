import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tyro_work/helper/themes.dart';

class ResizeableImage extends StatefulWidget {
  final String asset;
  final String label;
  final int imagesInWrap;
  const ResizeableImage(
      {super.key,
      required this.asset,
      required this.label,
      required this.imagesInWrap});

  @override
  State<ResizeableImage> createState() => _ResizeableImageState();
}

class _ResizeableImageState extends State<ResizeableImage> {
  @override
  Widget build(BuildContext context) {
    double deviceWidth(BuildContext context) =>
        MediaQuery.of(context).size.width;
    double deviceHeight(BuildContext context) =>
        MediaQuery.of(context).size.height;
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.15),
            blurRadius: 4,
            offset: Offset(10, 15),
          )
        ],
      ),
      constraints: BoxConstraints(
        maxHeight: deviceHeight(context) * (1 / (widget.imagesInWrap + 1)),
        maxWidth: deviceWidth(context) * (1 / (widget.imagesInWrap + 1)),
      ),
      child: GestureDetector(
          onTap: () => showPicFullscreen(context),
          child: Image.asset(
            widget.asset,
            semanticLabel: widget.label,
            fit: BoxFit.fitWidth,
          )),
    );
  }

  void showPicFullscreen(BuildContext context) async {
    double deviceWidth(BuildContext context) =>
        MediaQuery.of(context).size.width;
    double deviceHeight(BuildContext context) =>
        MediaQuery.of(context).size.height;
    List<double> picDimensions = await getPicSize(widget.asset);
    double picHeight = picDimensions[0];
    double picWidth = picDimensions[1];
    bool widerThanTall = picWidth > picHeight;
    // cannot use buildcontext across async gaps requires this mounted check, which requires the whole widget to be stateful
    if (mounted) {
      return await showDialog(
        context: context,
        builder: (BuildContext context) => Dialog(
          elevation: 0.0,
          shadowColor: const Color.fromRGBO(100, 100, 100, 0),
          backgroundColor: const Color.fromRGBO(100, 100, 100, 0),
          surfaceTintColor: const Color.fromRGBO(100, 100, 100, 0),
          child: Container(
            // when side x is longer than side y, and pic is x by y
            // the longer side will take the full size of the screen
            // so longerSide = deviceSize(context)
            // and shorterSide = (shorterSide / longerSide) * deviceSize(context)
            // just use the same device size of the longer for BOTH
            // but to account for the pics that are smaller than the screen, we take the min of the larger picSize, deviceSize

            // this works almost perfect, but encounters an issue when the image is wider on one side but close to square so you get clamped by the other side first so the ratio is wrong
            // also to explain the 75s - when the image is smaller than the container size, the 75s are the perfect offset to finesse the button to hang over the corner nicely
            constraints: BoxConstraints(
              maxWidth: (widerThanTall
                      ? min(picWidth, deviceWidth(context) * 0.9)
                      : (picWidth / picHeight) *
                          min(picHeight, deviceHeight(context) * 0.9)) +
                  75,
              maxHeight: (!widerThanTall
                      ? min(picHeight, deviceHeight(context) * 0.9)
                      : (picHeight / picWidth) *
                          min(picWidth, deviceWidth(context) * 0.9)) +
                  75,
            ),
            /*
            for debugging this math problem only
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.red,
                  blurRadius: 4,
                  offset: Offset(10, 15),
                )
              ],
            ),
            */
            child: Stack(
              alignment: AlignmentDirectional.topEnd,
              children: <Widget>[
                Center(
                    child: InteractiveViewer(
                        trackpadScrollCausesScale: true,
                        clipBehavior: Clip.none,
                        child: Image.asset(
                          widget.asset,
                          semanticLabel: widget.label,
                        ))),
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

  Future<List<double>> getPicSize(String asset) async {
    final ByteData bytes = await rootBundle.load(asset);
    var decodedImage = await decodeImageFromList(bytes.buffer.asUint8List());
    return [decodedImage.height.toDouble(), decodedImage.width.toDouble()];
  }
}
