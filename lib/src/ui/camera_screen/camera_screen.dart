import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({
    Key? key,
    this.cameras = const [],
  }) : super(key: key);
  final List<CameraDescription> cameras;
  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late final CameraController _cameraController;
  @override
  void initState() {
    super.initState();
    initCamera();
  }

  void initCamera() {
    _cameraController =
        CameraController(widget.cameras[0], ResolutionPreset.max);
    _cameraController.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CameraPreview(_cameraController);
  }
}
