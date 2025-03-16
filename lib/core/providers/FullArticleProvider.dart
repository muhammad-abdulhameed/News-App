import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class FullArticleProvider extends ChangeNotifier{
  String? uri;

  late WebViewController webViewController;
  getUri(String uri)async{
    webViewController=  WebViewController()  ..loadRequest(Uri.parse(uri));
  }
}