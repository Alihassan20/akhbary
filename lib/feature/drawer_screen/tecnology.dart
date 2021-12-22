
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/model/list_of_artical.dart';
import '../../core/server/news_api.dart';
import '../screen/details.dart';


class Tecnology extends StatefulWidget {
  const Tecnology({Key? key}) : super(key: key);

  @override
  _TecnologyState createState() => _TecnologyState();
}

class _TecnologyState extends State<Tecnology> {

  @override
  Widget build(BuildContext context) {
    final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();

    var future = NewsApi().fetchArticalByCategory('technology');
    Future<void> now()async {
      return NewsApi().fetchArticalByCategory('technology').then((user){
        setState(() {
          future=user;
        });
      });

    }
    //var provider=Provider.of<ArticleListViewModel>(context);
    final device = MediaQuery.of(context).size;
    return  Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    const Color.fromRGBO(46, 76, 109, 1).withOpacity(0.9),
                    const Color.fromRGBO(57, 110, 176, 1).withOpacity(0.5),
                    const Color.fromRGBO(218, 221, 252, 1).withOpacity(0.8),
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  stops: const [0, 0.5, 1])),
        ),
        title:  Text.rich(TextSpan(children: [
          TextSpan(
            text: "أخبارى",
            style: Theme.of(context).textTheme.headline5,
            // TextStyle(
            //     color: Color.fromRGBO(46, 76, 109, 1),
            //     fontWeight: FontWeight.bold,
            //     fontSize: 25),
          ),
        ])),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          buildGradient(),
          FutureBuilder(
            future: future,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              ListArticle? data = snapshot.data;
              if (snapshot.hasData) {
                return RefreshIndicator(
                  key: _refreshIndicatorKey,
                  onRefresh: now ,
                  child: ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemCount: data!.articals!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          child: Card(
                            shadowColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            color: Colors.white10.withOpacity(0.5),
                            child: Container(
                              width: device.width,
                              child: Column(
                                children: [
                                  data.articals![index].urlImage!=null ?
                                  GestureDetector(
                                    onTap:() async{
                                      await Future.delayed(const Duration(microseconds: 100), (){
                                        Navigator.pushNamed(context, DetailsScreen.routName,arguments: data.articals![index]);
                                      });
                                    } ,
                                    child: Container(
                                      height: device.height*0.3,
                                      width: device.width,
                                      child: Hero(
                                        tag:data.articals![index].title.toString(),
                                        child: ClipRRect(
                                          child: Image.network(data.articals![index].urlImage.toString(),fit:BoxFit.fill,),
                                          borderRadius:BorderRadius.circular(20),

                                        ),
                                      ),
                                    ),
                                  ):Hero(
                                    tag:data.articals![index].title.toString(),
                                    child: Container(
                                      width: device.width,
                                      height: device.height*0.3

                                      ,child: ClipRRect(
                                      child: Image.asset('image/nf.png',fit:BoxFit.fill),
                                      borderRadius:BorderRadius.circular(20),
                                    ),
                                    ),
                                  ),





                                  data.articals![index].urlImage!=null ?
                                  GestureDetector(
                                    onTap:() async{
                                      await Future.delayed(const Duration(microseconds: 500), (){
                                        Navigator.pushNamed(context, DetailsScreen.routName,arguments: data.articals![index]);
                                      });
                                    } ,
                                    child: Container(
                                      margin: const EdgeInsets.symmetric(horizontal: 10),
                                      child: Text(data.articals![index].title.toString(),style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                        textAlign: TextAlign.center,overflow: TextOverflow.ellipsis,maxLines: 2,),
                                    ),
                                  ): Container(
                                    margin: const EdgeInsets.symmetric(horizontal: 10),
                                    child: Text(data.articals![index].title.toString(),style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                      textAlign: TextAlign.center,overflow: TextOverflow.ellipsis,maxLines: 2,),
                                  ),

                                ],

                              ),
                            ),
                          ),
                        );
                      }),
                );
              } else {
                return  Center(child: SpinKitFadingCircle(
                  itemBuilder: (_, int index) {
                    return DecoratedBox(
                      decoration: BoxDecoration(
                        color: index.isEven ? const Color.fromRGBO(0, 11, 73, 1) : Colors.black54,
                      ),
                    );
                  },
                ));
              }
            },
          ),
        ],
      ),
    );
  }

  Container buildGradient() {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [
                const Color.fromRGBO(46, 76, 109, 1).withOpacity(0.9),
                const Color.fromRGBO(57, 110, 176, 1).withOpacity(0.5),
                const Color.fromRGBO(218, 221, 252, 1).withOpacity(0.8),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: const [0, 0.5, 1])),
    );
  }
}
