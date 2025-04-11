import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/mangers/stringsManger.dart';
import 'package:news_app/ui/webView/Screen/FullArticle.dart';
import 'package:news_app/ui/webView/modelClass/FullArticleModel.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:webview_flutter/webview_flutter.dart';

import '../../../models/ArticlesResponse/Articles.dart';

class ArticleItem extends StatefulWidget {
  Article articles;
   ArticleItem({super.key ,required this.articles});

  @override
  State<ArticleItem> createState() => _ArticleItemState();
}

class _ArticleItemState extends State<ArticleItem> {
late  WebViewController webViewController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();




  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
            context: context,
            builder: (c) => AlertDialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.r)),
                insetPadding: REdgeInsets.all(16),
                contentPadding: REdgeInsets.all(8),
                alignment: Alignment.bottomCenter,
                backgroundColor: Theme.of(context).colorScheme.onPrimary,
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ClipRRect(
                      clipBehavior: Clip.antiAlias,
                      borderRadius: BorderRadius.circular(8.r),
                      child: CachedNetworkImage(
                          errorWidget: (context, url, error) => Text(
                                error.toString(),
                              ).tr(),
                          progressIndicatorBuilder: (context, url, progress) =>
                              CircularProgressIndicator(
                                color: Colors.red,
                              ),
                          imageUrl:widget.articles.urlToImage??""
                              /*'https://plus.unsplash.com/premium_photo-1661255378914-d0934128d91d?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8YXJ0aWNsZXxlbnwwfHwwfHx8MA%3D%3D'*/,
                          fit: BoxFit.cover),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(maxLines: 5,
                      widget.articles.content??"No Articles"
                     /* "40-year-old man falls 200 feet to his death while canyoneering at national park40-year-old man falls 200 feet to his death while canyoneering at national park40-year-old man falls 200 feet to his death while canyoneering at national park"*/,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).colorScheme.primary),
                    ).tr(),
                    SizedBox(
                      height: 10.h,
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(padding: REdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16.r))),
                        onPressed: () {
                        Navigator.of(context).pushNamed(FullArticle.routeName,arguments:widget.articles.url.toString());
                        },
                        child: Text(
                          StringManger.viewFulArticles,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ).tr())
                  ],
                )));
      },
      child: Container(
        padding: REdgeInsets.all(8),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Theme.of(context).colorScheme.onPrimary)),
        child: Column(
          children: [
            ClipRRect(
              clipBehavior: Clip.antiAlias,
              borderRadius: BorderRadius.circular(8.r),
              child: CachedNetworkImage(
                  errorWidget: (context, url, error) => Text(
                        error.toString(),
                      ).tr(),
                  progressIndicatorBuilder: (context, url, progress) =>
                      CircularProgressIndicator(
                        color: Colors.red,
                      ),
                  imageUrl:widget.articles.urlToImage??""
                     /* 'https://plus.unsplash.com/premium_photo-1661255378914-d0934128d91d?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8YXJ0aWNsZXxlbnwwfHwwfHx8MA%3D%3D'*/,
                  fit: BoxFit.cover),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(maxLines: 5,
              widget.articles.content??""
              /*"40-year-old man falls 200 feet to his death while canyoneering at national park"*/,
              style: Theme.of(context).textTheme.bodyMedium,
            ).tr(),
            SizedBox(
              height: 10.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(overflow: TextOverflow.clip,
                    widget.articles.author??"",
                    maxLines: 2,
                    style: Theme.of(context).textTheme.bodySmall
                  ).tr(),
                ),
                Flexible(
                  child: Text(
                    timeago
                        .format(DateTime.parse(widget.articles.publishedAt??'')),
                    style: Theme.of(context).textTheme.bodySmall,
                  ).tr(),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
