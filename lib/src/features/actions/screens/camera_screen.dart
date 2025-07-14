import 'dart:io';

import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants.dart';
import '../../../core/utils.dart';
import '../../../core/widgets/button.dart';
import '../../../core/widgets/svg_widget.dart';
import 'camera_preview_screen.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  static const routePath = '/CameraScreen';

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController _cameraController;

  bool loading = true;

  void onCamera() async {
    try {
      await _cameraController.takePicture().then((value) {
        if (mounted) {
          context.push(
            CameraPreviewScreen.routePath,
            extra: File(value.path),
          );
        }
      });
    } catch (e) {
      logger('Error taking picture: $e');
    }
  }

  void getCameras() async {
    final cameras = await availableCameras();
    _cameraController = CameraController(
      cameras[0],
      ResolutionPreset.ultraHigh,
      enableAudio: false,
    );
    _cameraController.initialize().then((value) {
      setState(() {});
    });
    setState(() {
      loading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getCameras();
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          if (!loading) CameraPreview(_cameraController),
          Align(
            alignment: Alignment.center,
            child: Container(
              width: 250,
              height: 250 * 1.414,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: const Color(0xffE12426),
                  width: 3,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 15 + MediaQuery.of(context).viewPadding.bottom,
            left: 0,
            right: 0,
            child: Button(
              onPressed: onCamera,
              child: Container(
                height: 50,
                width: 50,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xffE12426),
                ),
                child: const Center(
                  child: SvgWidget(Assets.camera),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
