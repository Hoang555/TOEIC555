import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:webview_flutter/webview_flutter.dart';



class detailsPage extends StatefulWidget {
  final String url;
  const detailsPage({this.url});

  @override
  _detailsPageState createState() => _detailsPageState(url);
}

class _detailsPageState extends State<detailsPage> {

  String url;
  _detailsPageState(this.url);
  WebViewController _webViewController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios),
        ),
        title: Text(""),
        backgroundColor: Colors.green,
      ),

      body: WebView(
        initialUrl: '',
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController){
          _webViewController = webViewController;
          _loadHtmlFromAssets();
        },
      ),
    );
  }

  _loadHtmlFromAssets() async{
    String fileHtmlContents = await rootBundle.loadString(url);
    _webViewController.loadUrl(Uri.dataFromString(
        fileHtmlContents,
        mimeType: 'text/html',
        encoding: Encoding.getByName('utf-8')
    ).toString());
  }
}