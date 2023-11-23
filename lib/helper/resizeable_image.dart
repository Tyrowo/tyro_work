import 'package:flutter/material.dart';

class ResizeableImage extends StatelessWidget {
  final String asset;
  const ResizeableImage({super.key, required this.asset});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => showPicFullscreen(context),
        child: InteractiveViewer(child: Image.asset(asset)));
  }

  void showPicFullscreen(BuildContext context) async {
    return await showDialog(
      context: context,
      builder: (BuildContext context) => Dialog(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Stack(
                  alignment: AlignmentDirectional.topEnd,
                  children: <Widget>[
                    Image.asset(asset),
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
