import 'package:flutter/material.dart';
import 'package:news_app/ui/webView/modelClass/FullArticleModel.dart';
import 'package:webview_flutter/webview_flutter.dart';

class FullArticle extends StatefulWidget {
  static String routeName = "FullArticle";

  const FullArticle({
    super.key,
  });

  @override
  State<FullArticle> createState() => _FullArticleState();
}

class _FullArticleState extends State<FullArticle> {
  late String uri;
  late WebViewController webViewController;
  bool isWebInt = false;
var loadingProgress=0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    ///to make sure controller init one time
    webViewController = WebViewController();
    /*webViewController.setNavigationDelegate(
      NavigationDelegate(
        onPageStarted:(url) =>loadingProgress=0 ,
        onProgress: (progress) => loadingProgress=progress,
        onPageFinished:(url) =>  loadingProgress=100
      )
    );*/
  }

  @override
  didChangeDependencies() {
    /// that's for this function called after init state in life cycle and after widget inserted in tree mean can use context safe note ( the function also can called multi times if any dependence change )
    super.didChangeDependencies();
    uri = ModalRoute.of(context)?.settings.arguments as String;

    ///here can retch to context safely
    if (!isWebInt) {
      ///this flag ensure function  called one time
      webViewController..loadRequest(Uri.parse(uri));
      isWebInt = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
          child: Column(
            children: [
              /*if(loadingProgress<100)
              LinearProgressIndicator(value: loadingProgress/10 ,color: Colors.red,),*/
              Expanded(
                child: WebViewWidget(
        controller: webViewController,
      ),
              ),
            ],
          )),
    );
  }
}
