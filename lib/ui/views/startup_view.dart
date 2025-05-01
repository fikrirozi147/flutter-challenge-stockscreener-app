import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:stockscreener_app/ui/views/home_view.dart';

class StartupView extends StatefulWidget {
  const StartupView({super.key});

  @override
  State<StartupView> createState() => _StartupViewState();
}

class _StartupViewState extends State<StartupView> {
  late VideoPlayerController _controller;
  bool _hasNavigated = false; // Prevents multiple calls

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.asset('assets/videos/Stok-startup.mp4')
      ..initialize().then((_) {
        setState(() {});
        _controller.play();
      });

    _controller.addListener(() {
      if (!_hasNavigated &&
          _controller.value.isInitialized &&
          _controller.value.position >= _controller.value.duration) {
        _hasNavigated = true;

        WidgetsBinding.instance.addPostFrameCallback((_) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_) => const HomeView()),
          );
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: _controller.value.isInitialized
            ? AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              )
            : const CircularProgressIndicator(),
      ),
    );
  }
}
