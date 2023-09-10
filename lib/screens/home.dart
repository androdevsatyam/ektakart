import 'package:ektakart/app_assets.dart';
import 'package:ektakart/asset_res.dart';
import 'package:ektakart/screens/fullscreen_video_player.dart';
import 'package:ektakart/screens/video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../helpers.dart';
import '../models/video_data.dart';
import 'home_widgets/banners.dart';

class Home extends StatelessWidget {

  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: getAppHeader(),
        // drawer: getDrawer(),
        body: Container(
            padding: EdgeInsets.only(top: 5, left: 4, right: 4),
            child: Container(
              width: double.infinity,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Banners(),
                  // getUpperSection(),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          VideoData.title.toUpperCase(),
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        Helpers().getHeight(5),
                        Text(
                          VideoData.subtitle,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Helpers().getHeight(10),
                  Expanded(child: getOther()),
                ],
              ),
            )));
  }

  getDrawer() {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('User Profile'),
          ),
          ListTile(
            title: const Text('Option 1'),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            title: const Text('Option 1'),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
        ],
      ),
    );
  }

  getAppHeader() {
    return AppBar(
      leading: Icon(
        Icons.vertical_distribute,
        color: Colors.black38,
      ),
      elevation: 0,
      backgroundColor: Colors.white,
      title: Image.asset(
        AssetRes.logoWord,
        fit: BoxFit.fitHeight,
        height: 30,
      ),
      centerTitle: true,
    );
  }

  // getUpperSection() {
  //   return Container(
  //     height: Get.height / 2.6,
  //     child: Stack(
  //       alignment: AlignmentDirectional(0, 1),
  //       children: [
  //         Align(
  //           alignment: AlignmentDirectional(0, -1),
  //           child: getBanner(),
  //         ),
  //         Align(
  //             alignment: AlignmentDirectional(0, 0.9),
  //             child: Container(
  //               height: Get.height / 5.2,
  //               width: double.infinity,
  //               child: Column(children: [
  //                 Container(
  //                   margin: EdgeInsets.only(right: 15),
  //                   child: Row(
  //                       mainAxisAlignment: MainAxisAlignment.end,
  //                       children: AssetRes.images.map((imageUrl) {
  //                         int index = AssetRes.images.indexOf(imageUrl);
  //                         return Container(
  //                           width: 7,
  //                           height: 7,
  //                           margin: EdgeInsets.symmetric(horizontal: 4),
  //                           decoration: BoxDecoration(
  //                             shape: BoxShape.circle,
  //                             color: _currentValue == index
  //                                 ? Colors.white
  //                                 : Colors.white54,
  //                           ),
  //                         );
  //                       }).toList()),
  //                 ),
  //                 Expanded(
  //                   child: PageView.builder(
  //                     pageSnapping: true,
  //                     scrollDirection: Axis.horizontal,
  //                     itemCount: AssetRes.images.length,
  //                     controller: PageController(
  //                         initialPage: _currentValue, viewportFraction: .8),
  //                     onPageChanged: (int index) {
  //                       _currentValue = index;
  //                     },
  //                     itemBuilder: (BuildContext context, int index) {
  //                       return Container(
  //                         margin: EdgeInsets.only(top: 10, right: 15),
  //                         decoration: BoxDecoration(
  //                             borderRadius: BorderRadius.circular(10)),
  //                         child: InkWell(
  //                           onTap: () {
  //                             Navigator.push(
  //                               context,
  //                               MaterialPageRoute(
  //                                 builder: (context) => FullScreenVideoPlayer(
  //                                   videoId: AssetRes.youtube[index],
  //                                 ),
  //                               ),
  //                             );
  //                             /*Navigator.push(
  //                               context,
  //                               MaterialPageRoute(
  //                                 builder: (context) => FullScreenVideoPlayer(
  //                                   videoId: AssetRes.youtube[index],
  //                                 ),
  //                               ),
  //                             );*/
  //                           },
  //                           child: Stack(
  //                             fit: StackFit.expand,
  //                             children: [
  //                               ClipRRect(
  //                                 borderRadius: BorderRadius.circular(10),
  //                                 child: Image.network(
  //                                   AssetRes.images[index],
  //                                   fit: BoxFit.cover,
  //                                 ),
  //                               ),
  //                               Align(
  //                                 alignment: Alignment.bottomRight,
  //                                 child: Container(
  //                                   height: 30,
  //                                   width: 30,
  //                                   margin:
  //                                       EdgeInsets.only(bottom: 10, right: 10),
  //                                   decoration: BoxDecoration(
  //                                       color: Colors.white,
  //                                       borderRadius:
  //                                           BorderRadius.circular(20)),
  //                                   child: Icon(
  //                                     Icons.play_arrow,
  //                                     size: 20,
  //                                     color: Colors.blue,
  //                                   ),
  //                                 ),
  //                               )
  //                             ],
  //                           ),
  //                         ),
  //                       );
  //                     },
  //                   ),
  //                 )
  //               ]),
  //             )),
  //       ],
  //     ),
  //   );
  // }

  getBanner() {
    return Container(
      child: PageView.builder(itemBuilder: (BuildContext context, int index) {
        return Stack(
          fit: StackFit.loose,
          children: [
            Image.asset(
              AssetRes.ektaBanner,
              width: double.infinity,
              height: Get.height / 4,
              fit: BoxFit.fitWidth,
            ),
            Container(
              height: Get.height / 4,
              width: Get.width,
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              decoration: BoxDecoration(color: Colors.blue.withOpacity(.7)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppAssets.reachCloud,
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        letterSpacing: 02,
                        fontWeight: FontWeight.bold),
                  ),
                  Helpers().getHeight(5),
                  Text(
                    AppAssets.withEase,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      letterSpacing: 01,
                    ),
                  )
                ],
              ),
            )
          ],
        );
      }),
    );
  }

  getOther() {
    return SingleChildScrollView(
        child: Column(
      children: [
        Container(
          width: Get.width,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: Colors.black12,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Helpers().getHeight(20),
              Text(AppAssets.description.toUpperCase(),
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
              Helpers().getHeight(10),
              Container(
                  margin: const EdgeInsets.only(top: 5),
                  width: Get.width,
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black12,
                          blurRadius: 6,
                          spreadRadius: 6,
                          offset: Offset(0, 0.3))
                    ],),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      getHeading(AppAssets.keyFeatures),
                      Helpers().getHeight(10),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          getBullet(),
                          Helpers().getWidth(5),
                          getValue(AppAssets.loreumIpsum)
                        ],
                      ),
                      Helpers().getHeight(10),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          getBullet(),
                          Helpers().getWidth(5),
                          getValue(AppAssets.loreumIpsum)
                        ],
                      )
                    ],
                  )),
              Helpers().getHeight(15),
              Container(
                  margin: EdgeInsets.only(top: 5),
                  width: Get.width,
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black12,
                            blurRadius: 6,
                            spreadRadius: 6,
                            offset: Offset(0, 0.3))
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      getHeading(AppAssets.keyBenefit),
                      Helpers().getHeight(10),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          getBullet(),
                          Helpers().getWidth(5),
                          getValue(AppAssets.loreumIpsum)
                        ],
                      ),
                      Helpers().getHeight(10),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          getBullet(),
                          Helpers().getWidth(5),
                          getValue(AppAssets.loreumIpsum)
                        ],
                      )
                    ],
                  )),
              Helpers().getHeight(24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)))),
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                        child: Text("Read More >"),
                      )),
                  ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)))),
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                        child: Text("Book A Demo >"),
                      ))
                ],
              ),
              Helpers().getHeight(24),
            ],
          ),
        )
      ],
    ));
  }

  getBullet() {
    return const Padding(
      padding: EdgeInsets.only(top: 5),
      child: Icon(
        Icons.double_arrow_outlined,
        color: Colors.blue,
        size: 15,
      ),
    );
  }

  getValue(String text) {
    return Expanded(
      child: Text(text,
          softWrap: true,
          maxLines: 3,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 15,
          )),
    );
  }

  getHeading(String heading) {
    return Text(
      heading,
      style: const TextStyle(
          color: Colors.black, fontSize: 19, fontWeight: FontWeight.bold),
    );
  }
}
