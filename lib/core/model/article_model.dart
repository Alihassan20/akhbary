
class Article {String? title;
 String? description;
 String? url;
 String? urlImage;

  Article({this.title, this.description, this.url, this.urlImage});

     Article.fromJson( Map<String,dynamic> jsonData){
     title=jsonData['title'];
     description=jsonData['description'];
     url=jsonData['url'];
     urlImage=jsonData['urlToImage'];

   }

}