import 'package:bloomix/features/identify/presentation/cubit/identify_cubit.dart';
import 'package:bloomix/features/identify/presentation/pages/result_page.dart';
import 'package:bloomix/l10n/l10n.dart';
import 'package:bloomix_ds/bloomix_ds.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({super.key});

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  CameraController? _controller;
  List<CameraDescription>? _cameras;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    try {
      _cameras = await availableCameras();
      if (_cameras!.isNotEmpty) {
        _controller = CameraController(
          _cameras![0],
          ResolutionPreset.high,
          enableAudio: false,
        );

        await _controller!.initialize();
        if (mounted) {
          setState(() {
            _isInitialized = true;
          });
        }
      }
    } catch (e) {
      debugPrint('Error initializing camera: $e');
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  Future<void> _takePicture() async {
    if (_controller == null || !_controller!.value.isInitialized) {
      return;
    }

    try {
      final image = await _controller!.takePicture();
      // Use XFile.readAsBytes to support all platforms, including Web.
      final bytes = await image.readAsBytes();

      if (mounted) {
        context.read<IdentifyCubit>().identifyPlant(bytes, image.path);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute<void>(builder: (_) => const ResultPage()),
        );
      }
    } catch (e) {
      debugPrint('Error taking picture: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BloomixColors.neutral900,
      body: _isInitialized
          ? Stack(
              fit: StackFit.expand,
              children: [
                CameraPreview(_controller!),
                Positioned(
                  top: BloomixSpacing.custom(7.5),
                  left: BloomixSpacing.xxl,
                  child: Container(
                    decoration: BoxDecoration(
                      color: BloomixColors.withOpacity(
                        BloomixColors.neutral900,
                        0.5,
                      ),
                      borderRadius:
                          BorderRadius.circular(BloomixSizing.radiusXl),
                    ),
                    child: IconButton(
                      icon: const Icon(
                        Icons.arrow_back,
                        color: BloomixColors.textOnPrimary,
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.all(BloomixSpacing.huge),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          BloomixColors.transparent,
                          BloomixColors.withOpacity(
                            BloomixColors.neutral900,
                            0.8,
                          ),
                        ],
                      ),
                    ),
                    child: Column(
                      children: [
                        Text(
                          AppLocalizations.of(context).positionPlantCenter,
                          style: BloomixTypography.titleMedium.copyWith(
                            color: BloomixColors.textOnPrimary,
                          ),
                        ),
                        const SizedBox(height: BloomixSpacing.xxxl),
                        GestureDetector(
                          onTap: _takePicture,
                          child: Container(
                            width: BloomixSizing.custom(20),
                            height: BloomixSizing.custom(20),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: BloomixColors.textOnPrimary,
                                width: BloomixSizing.borderLg,
                              ),
                            ),
                            child: Container(
                              margin: const EdgeInsets.all(BloomixSpacing.sm),
                              decoration: const BoxDecoration(
                                color: BloomixColors.primary500,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          : const Center(
              child: CircularProgressIndicator(
                valueColor:
                    AlwaysStoppedAnimation<Color>(BloomixColors.primary500),
              ),
            ),
    );
  }
}
