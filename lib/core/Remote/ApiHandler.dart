import 'dart:convert';

import 'package:news_app/core/ApiConstants.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/models/ArticlesResponse/ArticleResponse.dart';
import 'package:news_app/models/SourcesResponse/SourceResponse.dart';

class ApiManger {
  static Future<SourceResponse?> getResources(String category) async {
    ///we create function that's have body of response(json)
    try{
    var url = Uri.https(baseUrl, "/v2/top-headlines/sources", {
      ///this constractor arrange your request link as domain / endPoint/q parameters
      "category": category
    });
    var response = await http.get(url, headers: {
      ///this's function that's make your request (trigger api to get response)Note:you can pass header with
      "Authorization": apiKey,
    });

    Map<String, dynamic> parsedJson = jsonDecode(response.body);

    ///the response body (json) returned as string of json this function parse it to json Note :json in flutter known as Map<String,dynamic>
   SourceResponse sourceResponse=SourceResponse.fromJson(parsedJson);
    print(sourceResponse);

    return sourceResponse;
  }catch(e){
     return null;
    }
  }
 static Future<ArticleResponse> getArticle(String source)async{
   var url= Uri.http(baseUrl,"/v2/top-headlines",{
      "sources":source
    });
  var response= await http.get(url,headers: {
      "Authorization": apiKey,
    });
  Map<String,dynamic> json=jsonDecode(response.body);
ArticleResponse articleResponse=ArticleResponse.fromJson(json);
return articleResponse;
  }
  static Future<ArticleResponse> searchForArticle(query)async{
    var url= Uri.http(baseUrl,"/v2/everything",{
      "q":query
    });
    var response=await http.get(url,headers: {
      "Authorization": apiKey,
    });
    Map<String,dynamic> parsedJson=jsonDecode(response.body);
    ArticleResponse searchArticleResponse=ArticleResponse.fromJson(parsedJson);
    return searchArticleResponse;
  }
}
