import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:sagwebtech/src/navigation_controls.dart';
import 'package:sagwebtech/src/web_view_stack.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "SagWebTech",
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: AnimatedSplashScreen(splash: Center(
        child: SizedBox(
          width: 300,
          height: 100,
          child: Image.asset('assets/images/sagwebtech.png'),
        ),
      ),
      duration: 3000,
      splashTransition: SplashTransition.fadeTransition,
       nextScreen: WebViewApp(),
       ),
    );
  }
}

class WebViewApp extends StatefulWidget {
  const WebViewApp({super.key});

  @override
  State<WebViewApp> createState() => _WebViewAppState();
}

class _WebViewAppState extends State<WebViewApp> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..loadRequest(
        Uri.parse('https://sagwebtech.com'),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SagWebTech"),
        actions: [
          NavigationControls(controller: controller),
         // Menu(controller: controller), 
        ],
         
      ),
      body: WebViewStack(controller: controller),
    );
  }
}