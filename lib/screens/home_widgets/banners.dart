import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app_assets.dart';
import '../../asset_res.dart';
import '../../helpers.dart';
import '../fullscreen_video_player.dart';

class Banners extends StatefulWidget {
  Banners({Key? key}) : super(key: key);

  int _currentValue = 0;

  @override
  State<Banners> createState() => _BannersState();
}

class _BannersState extends State<Banners> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height / 2.6,
      child: Stack(
        alignment: AlignmentDirectional(0, 1),
        children: [
          Align(
            alignment: AlignmentDirectional(0, -1),
            child: getBanner(),
          ),
          Align(
              alignment: AlignmentDirectional(0, 0.9),
              child: Container(
                height: Get.height / 5.2,
                width: double.infinity,
                child: Column(children: [
                  Container(
                    margin: const EdgeInsets.only(right: 15),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: AssetRes.banners.map((imageUrl) {
                          int index = AssetRes.banners.indexOf(imageUrl);
                          return Container(
                            width: 7,
                            height: 7,
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: widget._currentValue == index
                                  ? Colors.white
                                  : Colors.white54,
                            ),
                          );
                        }).toList()),
                  ),
                  Expanded(
                    child:
                    PageView.builder(
                      pageSnapping: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: AssetRes.images.length,
                      controller: PageController(
                          initialPage: widget._currentValue,
                          viewportFraction: .9),
                      onPageChanged: (int index) {
                        // setState(() {
                        //   widget._currentValue = index;
                        // });
                      },
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          margin: EdgeInsets.only(top: 10, right: 15),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10)),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => FullScreenVideoPlayer(
                                    videoId: AssetRes.youtube[index],
                                  ),
                                ),
                              );
                              /*Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => FullScreenVideoPlayer(
                                    videoId: AssetRes.youtube[index],
                                  ),
                                ),
                              );*/
                            },
                            child: Stack(
                              fit: StackFit.expand,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    AssetRes.images[index],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: Container(
                                    height: 30,
                                    width: 30,
                                    margin: const EdgeInsets.only(
                                        bottom: 10, right: 10),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: const Icon(
                                      Icons.play_arrow,
                                      size: 20,
                                      color: Colors.blue,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ]),
              )),
        ],
      ),
    );
  }

  getBanner() {
    return Container(
      child: PageView.builder(
        itemCount: AssetRes.banners.length,
        itemBuilder: (BuildContext context, int index) {
          return Stack(
            fit: StackFit.loose,
            children: [
              Image.network(
                AssetRes.banners[index],
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
        },
        onPageChanged: (int index) {
          setState(() {
            widget._currentValue = index;
          });
        },
      ),
    );
  }
}
