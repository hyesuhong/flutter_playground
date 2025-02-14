import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:thread_clone/constants/gaps.dart';
import 'package:thread_clone/constants/sizes.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen>
    with WidgetsBindingObserver, SingleTickerProviderStateMixin {
  bool _hasPermission = false;
  bool _isSelfieMode = false;

  late CameraController? _cameraController;

  late final AnimationController _animationController = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 200),
  );
  late final Animation<double> _buttonAnimation =
      Tween(begin: 1.0, end: 0.9).animate(_animationController);

  @override
  void initState() {
    super.initState();
    _initPermission();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (_cameraController == null || !_cameraController!.value.isInitialized) {
      return;
    }

    if (state == AppLifecycleState.inactive) {
      if (_cameraController != null) {
        _cameraController!.dispose();
      }
    } else if (state == AppLifecycleState.resumed) {
      _initCamera();
    }
  }

  @override
  void dispose() {
    if (_cameraController != null) {
      _cameraController!.dispose();
    }
    _animationController.dispose();
    super.dispose();
  }

  void _onBackTap() {
    Navigator.of(context).pop();
  }

  Future<void> _initPermission() async {
    final cameraPermission = await Permission.camera.request();
    final cameraIsDenied =
        cameraPermission.isDenied || cameraPermission.isPermanentlyDenied;

    if (!cameraIsDenied) {
      _hasPermission = true;
      await _initCamera();
      setState(() {});
    }
  }

  Future<void> _initCamera() async {
    final cameras = await availableCameras();

    if (cameras.isEmpty) {
      return;
    }

    _cameraController = CameraController(
      cameras[_isSelfieMode ? 1 : 0],
      ResolutionPreset.medium,
    );

    await _cameraController?.initialize();

    setState(() {});
  }

  Future<void> _toggleSelfieMode() async {
    _isSelfieMode = !_isSelfieMode;
    await _initCamera();
    setState(() {});
  }

  Future<void> _takePicture(TapDownDetails details) async {
    if (_cameraController == null) {
      return;
    }

    if (_cameraController!.value.isTakingPicture) {
      return;
    }

    await _animationController.forward();
    await _animationController.reverse();

    final picture = await _cameraController!.takePicture();

    if (!mounted) {
      return;
    }

    Navigator.of(context).pop([picture]);
  }

  Future<void> _onPickPicturePressed() async {
    final pictures = await ImagePicker().pickMultiImage();

    if (pictures.isEmpty) {
      return;
    }

    if (!mounted) {
      return;
    }

    Navigator.of(context).pop(pictures);
  }

  bool _getCameraIsAvailable() =>
      _hasPermission &&
      _cameraController != null &&
      _cameraController!.value.isInitialized;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: _getCameraIsAvailable()
              ? Stack(
                  alignment: Alignment.center,
                  children: [
                    if (_cameraController != null)
                      CameraPreview(_cameraController!),
                    Positioned(
                      top: Sizes.size20,
                      left: 0,
                      child: IconButton(
                        onPressed: _onBackTap,
                        icon: FaIcon(
                          FontAwesomeIcons.chevronLeft,
                          color: Colors.grey.shade500,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: Sizes.size24,
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          IconButton(
                            onPressed: _onPickPicturePressed,
                            icon: FaIcon(
                              FontAwesomeIcons.photoFilm,
                              color: Colors.grey.shade500,
                            ),
                          ),
                          GestureDetector(
                            onTapDown: _takePicture,
                            child: ScaleTransition(
                              scale: _buttonAnimation,
                              child: Container(
                                width: Sizes.size64,
                                height: Sizes.size64,
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.2),
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 4,
                                  ),
                                  borderRadius:
                                      BorderRadius.circular(Sizes.size64),
                                ),
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: _toggleSelfieMode,
                            icon: FaIcon(
                              FontAwesomeIcons.cameraRotate,
                              color: Colors.grey.shade500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: Sizes.size24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Permission for using files",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: Sizes.size18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Gaps.v8,
                      Text(
                        "If you want to attach photos, you should allow to set the required permissions.",
                        style: TextStyle(
                          color: Colors.grey.shade300,
                        ),
                      ),
                      Gaps.v20,
                      GestureDetector(
                        onTap: () => openAppSettings(),
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                              vertical: Sizes.size12),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(Sizes.size8),
                          ),
                          child: const Text("Go to Setting"),
                        ),
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
