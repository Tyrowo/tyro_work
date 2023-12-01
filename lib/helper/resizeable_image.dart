import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
          maxWidth: deviceWidth(context) * (1 / (widget.imagesInWrap + 1))),
      // height: deviceHeight(context) * (1 / (widget.imagesInWrap)),
      // width: deviceWidth(context) * (1 / (widget.imagesInWrap + 1)),
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
    // cannot use buildcontext across async gaps requires this mounted check, which requires the whole widget to be stateful
    if (mounted) {
      return await showDialog(
        context: context,
        builder: (BuildContext context) => Dialog(
          elevation: 0.0,
          shadowColor: const Color.fromRGBO(100, 100, 100, 0),
          backgroundColor: const Color.fromRGBO(100, 100, 100, 0),
          surfaceTintColor: const Color.fromRGBO(100, 100, 100, 0),
          child: SizedBox(
            height: min(deviceHeight(context) * 0.95, picHeight + 75),
            width: min(deviceWidth(context) * 0.95, picWidth + 75),
            child: Stack(
              alignment: AlignmentDirectional.topEnd,
              children: <Widget>[
                Center(
                    child: InteractiveViewer(
                        child: Image.asset(
                  widget.asset,
                  semanticLabel: widget.label,
                  fit: BoxFit.cover,
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
