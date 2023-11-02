import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:pygmyapp_menu/cardkopsu.dart';
import 'package:pygmyapp_menu/classnkopi.dart';
import 'package:pygmyapp_menu/drawer_widget.dart';

import 'detailnkopi.dart';

class Cardnkopi extends StatefulWidget {
  const Cardnkopi({super.key});

  @override
  _CardnkopiState createState() => _CardnkopiState();
}

class _CardnkopiState extends State<Cardnkopi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pygmy Owl Coffee"),
        backgroundColor: Colors.brown,
        elevation: 0.0,
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Container(
        height: 850,
        padding: const EdgeInsets.all(35),
        child: ListView.builder(
            itemCount: infonKopi.length,
            //itemWidth: MediaQuery.of(context).size.width - 2 * 64,
            //  layout: SwiperLayout.STACK,
            //  pagination: SwiperPagination(
            //    builder:
            //         DotSwiperPaginationBuilder(activeSize: 20, space: 8),
            //    ),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      PageRouteBuilder(
                          pageBuilder: (context, a, b) => Detailnkopi(
                                infonKopi: infonKopi[index],
                              )));
                },
                child: Stack(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        const SizedBox(
                          height: 32,
                        ),
                        Card(
                          elevation: 8,
                          color: Colors.brown,
                          shape: ContinuousRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Image.asset(
                                  infonKopi[index].icon,
                                  height: 250,
                                ),
                                Text(
                                  infonKopi[index].nama,
                                  style: const TextStyle(
                                    fontFamily: 'Avenir',
                                    fontSize: 30,
                                    color: Color.fromARGB(255, 251, 250, 255),
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                                Text(
                                  infonKopi[index].harga,
                                  style: const TextStyle(
                                    fontFamily: 'Avenir',
                                    fontSize: 20,
                                    color: Color.fromARGB(255, 251, 250, 255),
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                                const SizedBox(
                                  height: 11,
                                ),
                                const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      'See More',
                                      style: TextStyle(
                                        fontFamily: 'Avenir',
                                        fontSize: 20,
                                        //    color: secondaryTextColor,
                                        fontWeight: FontWeight.w900,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                    //  Icon(Icons.arrow_forward_ios,
                                    //         color: secondaryTextColor),
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    // Image.asset(
                    //   benuas[index].iconImage,
                    //  ),
                  ],
                ),
              );
            }),
      ),
      drawer: const DrawerWidget(),
    );
  }
}
