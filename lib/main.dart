import 'package:flutter/material.dart';
import 'package:webview_flutter_plus/webview_flutter_plus.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const WebViewPage(title: 'Raku-Share'),
    );
  }
}

class WebViewPage extends StatefulWidget {
  const WebViewPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _WebViewState createState() => _WebViewState();
}

class _WebViewState extends State<WebViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: WebViewPlus(
        onWebViewCreated: (controller) {
          controller.loadUrl('https://rakushare.bounceme.net');
        },
        // javascriptを有効化
        javascriptMode: JavascriptMode.unrestricted,
        // javascriptChannels: {
        //   JavascriptChannel(
        //       name: "flutterApp", // （３）
        //       onMessageReceived: (JavascriptMessage result) {
        //         ScaffoldMessenger.of(context).showSnackBar(// （４）
        //             SnackBar(content: Text(result.message)));
        //       })
        // }
      ),
    );
  }
}
