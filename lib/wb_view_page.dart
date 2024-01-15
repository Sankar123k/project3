import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class WebviewPage extends StatefulWidget {
  const WebviewPage({super.key});

  @override
  State<WebviewPage> createState() => _WebviewPageState();
}

class _WebviewPageState extends State<WebviewPage> {
  @override
  void initState() {
    _loadWebsite();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
  _loadWebsite()async{
    final url='https://flutter.dev/';
    if(await canLaunchUrl(Uri.parse(url))){
      await launchUrl(Uri.parse(url));
    }
    else {
      throw "Website can't load";
    }
  }

}
