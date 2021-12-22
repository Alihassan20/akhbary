import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/model/article_model.dart';

class DetailsScreen extends StatefulWidget {
  static const routName = "/Details";

  const DetailsScreen({Key? key}) : super(key: key);

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

launchUrl(url) async {
  try {
    await canLaunch(url)
        ? await launch(
      url,
      forceWebView: true,
      enableJavaScript: true,
    )
        : throw ("valid");
  } catch (e) {}
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    var detail = ModalRoute.of(context)!.settings.arguments as Article;
    final device = MediaQuery.of(context).size;

    return Scaffold(
        appBar: buildAppBar(),
        body: Stack(
          children: [
            buildContainer(),
            Container(
              height: device.height * 0.7,
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: SingleChildScrollView(
                child: buildColumn(detail),
              ),
            ),
            Positioned(
              width: device.width * 1,
              bottom: 18,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    const Text(
                      "إذهب إلى اللينك المرفق لقراءة المقال",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily:'ArefRuqaa' ,
                          color: Colors.red,
                          fontSize: 13),
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                    ),
                    GestureDetector(
                      onTap: (){
                        launchUrl(detail.url!);

                      },
                      child: Text(
                        detail.url!,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                            fontSize: 13),
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }

  Column buildColumn(Article detail) {
    return Column(
      children: [
        Text(
          detail.title!,
          style: const TextStyle(
             color: Colors.black,
              fontWeight: FontWeight.bold, fontSize: 20),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 5),
        Hero(
          tag: detail.title.toString(),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(detail.urlImage.toString(),
            fit: BoxFit.contain,),
            // child: CachedNetworkImage(
            //     imageUrl: detail.urlImage.toString(),
            //     errorWidget: (context, url, error) =>
            //         Image.asset("image/nf.png"),
            //     fit: BoxFit.cover,
            //     placeholder: (context, url) => const CircularProgressIndicator()
            //   // Image.asset("image/nf.png"),
            // ),
          ),
        ),
        const SizedBox(height: 10),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            "\" ${detail.description!} \" . ",
            textDirection: TextDirection.rtl,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black87,
                fontSize: 17),
            textAlign: TextAlign.right,
          ),
        ),
      ],
    );
  }

  Container buildContainer() {
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

  AppBar buildAppBar() {
    return AppBar(
      leading: GestureDetector(
        onTap: ()async{
      await Future.delayed(const Duration(microseconds: 100), (){
          Navigator.of(context).pop();
      });
        },
          child: const Icon(Icons.arrow_back)),
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
        ),
      ])),
      centerTitle: true,
    );
  }
}