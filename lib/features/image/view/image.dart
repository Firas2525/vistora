import 'package:clothesget/features/image/view/widgets/BuildFloatingActionButton.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';

class ShowImage extends StatefulWidget {
  const ShowImage({Key? key, required this.image}) : super(key: key);
  final String image;
  @override
  State<ShowImage> createState() => _ShowImageState();
}

class _ShowImageState extends State<ShowImage> {
  double _scale = 1;
  double _previousScale = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: const BuildFloatingActionButton(),
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          Center(
            child: Container(
              margin: EdgeInsets.fromLTRB(
                  MediaQuery.of(context).size.width * 0.0,
                  MediaQuery.of(context).size.height * 0.0,
                  MediaQuery.of(context).size.width * 0.0,
                  0),
              width: MediaQuery.of(context).size.width * 1,
              height: MediaQuery.of(context).size.height * 1,
              child: GestureDetector(
                onDoubleTap: () {
                  if (_scale == 1) {
                    setState(() {
                      _scale = 2.4;
                    });
                  } else {
                    setState(() {
                      _scale = 1;
                    });
                  }
                },
                onScaleStart: (ScaleStartDetails details) {
                  _previousScale = _scale;
                },
                onScaleUpdate: (ScaleUpdateDetails details) {
                  setState(() {
                    _scale = _previousScale * details.scale;
                  });
                },
                child: InteractiveViewer(
                    panEnabled: true,
                    minScale: 0.5,
                    maxScale: 5.0,
                    scaleEnabled: true,
                    transformationController: TransformationController()
                      ..value = Matrix4.identity(),
                    child: Image.network(
                      widget.image
                )))
            ),
          ),
        ],
      ),
    );
  }
}



