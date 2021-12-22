import 'package:akhbarna/feature/drawer_screen/general.dart';
import 'package:akhbarna/feature/drawer_screen/healt.dart';
import 'package:akhbarna/feature/drawer_screen/tecnology.dart';
import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:url_launcher/url_launcher.dart';
import '../bottom_screen/artist.dart';
import '../bottom_screen/health.dart';
import '../bottom_screen/politics.dart';
import '../bottom_screen/sports.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {


  @override
  Widget build(BuildContext context) {
    final device = MediaQuery.of(context).size;
    return ZoomDrawer(
      style: DrawerStyle.Style1,
      menuScreen: const MENU_SCREEN(),
      mainScreen: const MAIN_SCREEN(),
      borderRadius: 40.0,
      showShadow: true,
      angle: -12.0,
      backgroundColor: Colors.white70,
      slideWidth: MediaQuery.of(context).size.width * .50,
      openCurve: Curves.easeIn,
      closeCurve: Curves.easeInOut,
      isRtl:true,
    );
  }
}

class MENU_SCREEN extends StatefulWidget {
  const MENU_SCREEN({Key? key}) : super(key: key);

  @override
  _MENU_SCREENState createState() => _MENU_SCREENState();
}
var url = "https://github.com/Alihassan20";
String str = "get the link";

void launchUrl() async {
  try {
    await canLaunch(url)
        ? await launch(
      url,
      forceWebView: true,
      enableJavaScript: true,
    )
        : throw ("valid");
  } catch (e) {
    str = e.toString();
  }
}




class _MENU_SCREENState extends State<MENU_SCREEN> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
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
          child: ListView(
            children: <Widget>[

              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: SizedBox(
                  height: 200,
                  child: DrawerHeader(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          padding:const  EdgeInsets.only(bottom: 10,right: 5),
                          child:const  DecoratedBox(
                            decoration: ShapeDecoration(
                                shape:  CircleBorder(),
                                color: Colors.white,
                                image: DecorationImage(
                                  fit: BoxFit.contain,
                                  image:  AssetImage("image/newslogo.png"),
                                )),
                          ),
                        ),
                         Padding(
                          padding:  const EdgeInsets.only(right: 35,top: 5),
                          child:  Text(
                            "أخبارى",
                            style: Theme.of(context).textTheme.headline5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Padding(
                    padding:  EdgeInsets.only(right: 30),
                    child: Text("أخبار أخرى",style:  TextStyle(
                        fontSize: 25,fontWeight:FontWeight.bold,fontFamily: 'ArefRuqaa'
                    ),),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        child:const  Text("التكنولوجيا", style: TextStyle(color: Colors.black87,fontFamily:'ArefRuqaa' ,fontSize: 18,fontWeight:FontWeight.bold),),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (_){
                            return const Tecnology();
                          }));
                        },
                      ),
                      const Icon(Icons.biotech_outlined ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [

                      TextButton(
                        child:const  Text("الصحة", style: TextStyle(color: Colors.black87,fontFamily:'ArefRuqaa' ,fontSize: 18,fontWeight:FontWeight.bold),),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (_){
                            return const Healt();
                          }));

                        },
                      ),
                    const   Icon(Icons.health_and_safety),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [

                      TextButton(
                        child:const  Text("أخبار عامة", style: TextStyle(color: Colors.black87,fontFamily:'ArefRuqaa' ,fontSize: 18,fontWeight:FontWeight.bold),),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (_){
                            return const General();
                          }));

                        },
                      ),
                      const Icon(Icons.all_inclusive_outlined),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Divider(
                  color: Colors.black26,
                  thickness: 1
              ),
              const SizedBox(height: 10),

              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      FlatButton(
                        child: const Text("تواصل معنا", style: TextStyle(
                          fontFamily: 'ArefRuqaa',
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black87,)),
                        onPressed: () async => await launch(
                            "https://wa.me/${01206614841}?text=Hello"),
                      ),
                      const Icon(Icons.call),

                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      FlatButton(
                        child: const Text("أرسل رأيك", style: TextStyle(
                          fontFamily: 'ArefRuqaa',
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black87,)),
                        onPressed: () =>launchUrl(),
                      ),
                      const SizedBox(width: 13),
                      const Icon(Icons.feedback),

                    ],
                  ),

                  Padding(
                    padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height*0.08,right: 6),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          child:Image.asset('image/egypt.png') ,
                        ),
                        const Text("Developed By Ali El_Mahdy",style:  TextStyle(
                            fontFamily: 'ArefRuqaa',
                            fontWeight: FontWeight.bold,
                            fontSize: 10
                        ))
                      ],
                    ),
                  ),


                ],

              ),

            ],
          ),
        ),
      ),
    );
  }
}



class MAIN_SCREEN extends StatefulWidget {
  const MAIN_SCREEN({Key? key}) : super(key: key);

  @override
  _MAIN_SCREENState createState() => _MAIN_SCREENState();
}
int _tabBarIndex = 0;
List<Widget> screens = [
  const Sports(),
  const Artist(),
  const Health(),
  const Science(),
];

class _MAIN_SCREENState extends State<MAIN_SCREEN> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: StyleProvider(
        style: Style(),
        child: ConvexAppBar(
          style: TabStyle.flip,
          items: const [
            TabItem(title: "الرياضة", icon: Icon(Icons.sports_baseball)),
            TabItem(title: "الفن", icon: Icon(Icons.movie)),
            TabItem(title: "المال والاعمال", icon: Icon(Icons.business)),
            TabItem(title: "العلوم", icon: Icon(Icons.science)),
          ],
          elevation: 0,
          activeColor: Colors.black87,
          backgroundColor:
          const Color.fromRGBO(218, 221, 252, 1).withOpacity(0.9),
          initialActiveIndex: _tabBarIndex,
          onTap: (value) {
            setState(() {
              _tabBarIndex = value;
            });
          },
        ),
      ),
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
        actions: [
          IconButton(
              onPressed: () => ZoomDrawer.of(context)!.toggle(),
              icon:const Icon(Icons.menu))
        ], ),
      body:  screens[_tabBarIndex],
    );
  }
}

class Style extends StyleHook {
  @override
  double get activeIconSize => 35;

  @override
  double get activeIconMargin => 20;

  @override
  double get iconSize => 20;

  @override
  TextStyle textStyle(Color color) {
    return TextStyle(fontSize: 17, color: color,fontFamily: 'ArefRuqaa');
  }
}