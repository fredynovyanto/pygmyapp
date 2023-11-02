// ignore: unnecessary_import
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pygmyapp_menu/drawer_widget.dart';

import 'classmanual.dart';

class DetailManual extends StatelessWidget {
  final InfoManual infoManual;

  const DetailManual({Key? key, required this.infoManual}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
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
                          color: Colors.grey[300],
                          height: 300,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              //  Text(
                              //     benuaInfo.position.toString(),
                              //    style: TextStyle(
                              //     fontFamily: 'Avenir',
                              //        fontSize: 200,
                              //       fontWeight: FontWeight.w900,
                              //      ),
                              //    ),
                              Image.asset(
                                infoManual.icon,
                                fit: BoxFit.contain,
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 5),
                       
                        Row(children: <Widget>[
                          
                          Text(
                            "",
                            style: TextStyle(
                              fontFamily: 'Avenir',
                              fontSize: 40,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          Text(
                            infoManual.nama,
                            style: TextStyle(
                              fontFamily: 'Avenir',
                              fontSize: 40,
                              color: Colors.black,
                              fontWeight: FontWeight.w900,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ]),
                        
                        Divider(color: Colors.black38),
                        SizedBox(height: 20),
                        Text(
                          infoManual.detail,
                          maxLines: 100,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontFamily: 'Avenir',
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 10),
                        
                  
                      
                        Divider(color: Colors.black38),
                        SizedBox(height: 10),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 32.0),
                    child: Text(
                      'Gallery',
                      style: TextStyle(
                        fontFamily: 'Avenir',
                        fontSize: 25,
                        color: const Color(0xff47455f),
                        fontWeight: FontWeight.w300,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    height: 300,
                    padding: const EdgeInsets.all(12.0),
                    child: ListView.builder(
                        itemCount: infoManual.gambar.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Card(
                            clipBehavior: Clip.antiAlias,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: Container(
                                height: 250,
                                width: 400,
                                child: Image.asset(
                                  infoManual.gambar[index],
                                  fit: BoxFit.fitHeight,
                                )),
                          );
                        }),
                  ),
                  SizedBox(height: 20)
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
                infoManual.nama,
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
