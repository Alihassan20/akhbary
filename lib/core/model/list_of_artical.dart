
import 'article_model.dart';

class ListArticle{
  List<Article>? articals;
  ListArticle({this.articals});

   ListArticle.fromJson ( Map<String , dynamic> jsonData){
     articals=(jsonData['articles']as List).map((e) => Article.fromJson(e)).toList();
  }

}