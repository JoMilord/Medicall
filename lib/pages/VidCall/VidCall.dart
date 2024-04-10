import 'package:flutter/material.dart';
import 'package:opentok_flutter/opentok.dart';
import 'package:opentok_flutter/opentok_view.dart';
import 'package:permission_handler/permission_handler.dart';

class VideoChatWidget extends StatefulWidget {
  const VideoChatWidget({Key? key}) : super(key: key);

  @override
  _VideoChatWidgetState createState() => _VideoChatWidgetState();
}

class _VideoChatWidgetState extends State<VideoChatWidget> with WidgetsBindingObserver {
  late OpenTokConfig _config;
  OpenTokController? _controller;
  bool isFullScreen = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    initPlatformState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        _controller?.resume();
        break;
      case AppLifecycleState.paused:
        _controller?.pause();
        break;
      default:
    }
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    _config = OpenTokConfig(
      apiKey: "47851171",
      sessionId: "1_MX40Nzg1MTE3MX5-MTcxMDI5NTc2NzIwNn43OTlDalMzYnNwZ085WTExVVBqRDNuUkx-fn4",
      token: "T1==cGFydG5lcl9pZD00Nzg1MTE3MSZzaWc9NDU0MGQwNWUwMGVmYzhhZmFjMTQ0ZmJiYzY2ODI1NGJjOWJjMjc5ZjpzZXNzaW9uX2lkPTFfTVg0ME56ZzFNVEUzTVg1LU1UY3hNREk1TlRjMk56SXdObjQzT1RsRGFsTXpZbk53WjA4NVdURXhWVkJxUkROdVVreC1mbjQmY3JlYXRlX3RpbWU9MTcxMDI5NTc3NiZub25jZT0wLjk3NjgxODkxMzM4OTcwMTgmcm9sZT1wdWJsaXNoZXImZXhwaXJlX3RpbWU9MTcxMjg4Nzc3NiZpbml0aWFsX2xheW91dF9jbGFzc19saXN0PQ==");

    _controller = OpenTokController();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      Map<Permission, PermissionStatus> statuses = await [
        Permission.camera,
        Permission.microphone,
      ].request();
      final isGranted =
          statuses[Permission.camera] == PermissionStatus.granted &&
              statuses[Permission.microphone] == PermissionStatus.granted;
      if (isGranted) {
        _controller?.initSession(_config);
      } else {
        debugPrint(
            "Camera or Microphone permission or both denied by the user!");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Medicall'),
        actions: [
          IconButton(
            onPressed: () => _controller?.initSession(_config),
            icon: const Icon(Icons.video_call_rounded),
          )
        ],
      ),
      body: SizedBox(
        height: isFullScreen
            ? MediaQuery.of(context).size.height
            : MediaQuery.of(context).size.height * 0.5,
        child: OpenTokView(
          controller: _controller ?? OpenTokController(),
          padding: const EdgeInsets.only(bottom: 10),
          onFullScreenButtonTap: () =>
              setState(() => isFullScreen = !isFullScreen),
          onEndButtonTap: () => _controller?.endSession(),
          onCameraButtonTap: () => _controller?.toggleCamera(),
          onMicButtonTap: (isEnabled) => _controller?.toggleAudio(!isEnabled),
          onVideoButtonTap: (isEnabled) => _controller?.toggleVideo(!isEnabled),
        ),
      ),
    );
  }
}
