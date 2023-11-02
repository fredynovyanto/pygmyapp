// ignore: unnecessary_import
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pygmyapp_menu/drawer_widget.dart';
import 'package:pygmyapp_menu/models/menu_model.dart';

class DetailMenu extends StatelessWidget {
  final Menu menu;

  const DetailMenu({Key? key, required this.menu}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(menu.image);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Pygmy Owl Coffee",
          style: TextStyle(fontSize: 20),
        ),
        backgroundColor: Colors.brown,
        elevation: 0.0,
        centerTitle: true,
      ),
      body: SafeArea(
        bottom: false,
        child: Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          height: 300,
                          decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(menu.image)), color: Colors.grey[300]),
                        ),
                        const SizedBox(height: 5),
                        Row(children: <Widget>[
                          const Text(
                            "",
                            style: TextStyle(
                              fontFamily: 'Avenir',
                              fontSize: 40,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              menu.name,
                              style: const TextStyle(
                                fontFamily: 'Avenir',
                                fontSize: 40,
                                color: Colors.black,
                                fontWeight: FontWeight.w900,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ]),
                        const Divider(color: Colors.black38),
                        const SizedBox(height: 20),
                        Text(
                          menu.detail,
                          maxLines: 100,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontFamily: 'Avenir',
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Divider(color: Colors.black38),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                  // const Padding(
                  //   padding: EdgeInsets.only(left: 32.0),
                  //   child: Text(
                  //     'Gallery',
                  //     style: TextStyle(
                  //       fontFamily: 'Avenir',
                  //       fontSize: 25,
                  //       color: Color(0xff47455f),
                  //       fontWeight: FontWeight.w300,
                  //     ),
                  //     textAlign: TextAlign.left,
                  //   ),
                  // ),
                  // Container(
                  //   height: 300,
                  //   padding: const EdgeInsets.all(12.0),
                  //   child: ListView.builder(
                  //       itemCount: infoKopsu.gambar.length,
                  //       scrollDirection: Axis.horizontal,
                  //       itemBuilder: (context, index) {
                  //         return Card(
                  //           clipBehavior: Clip.antiAlias,
                  //           shape: RoundedRectangleBorder(
                  //             borderRadius: BorderRadius.circular(24),
                  //           ),
                  //           child: Container(
                  //               height: 250,
                  //               width: 400,
                  //               child: Image.asset(
                  //                 infoKopsu.gambar[index],
                  //                 fit: BoxFit.fitHeight,
                  //               )),
                  //         );
                  //       }),
                  // ),
                  const SizedBox(height: 20)
                ],
              ),
            ),
            //Positioned(
            //  right: -64,
            // child: Hero(
            //     tag: benuaInfo.position,
            //   child: Image.asset(benuaInfo.iconImage)),
            // ),
            Positioned(
              child: Text(
                menu.name,
                style: TextStyle(
                  fontFamily: 'Avenir',
                  fontSize: 100,
                  color: Colors.white.withOpacity(0.08),
                  fontWeight: FontWeight.w900,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
      drawer: const DrawerWidget(),
    );
  }
}
