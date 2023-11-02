import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:pygmyapp_menu/cardkopsu.dart';
import 'package:pygmyapp_menu/drawer_widget.dart';

import 'classmanual.dart';
import 'detailmanual.dart';

class Cardmanual extends StatefulWidget {
  @override
  _CardmanualState createState() => _CardmanualState();
}

class _CardmanualState extends State<Cardmanual> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pygmy Owl Coffee"),
        backgroundColor: Colors.brown,
        elevation: 0.0,
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Container(
        height: 850,
        padding: const EdgeInsets.all(35),
        child: ListView.builder(
            itemCount: infomanual.length,
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
                          pageBuilder: (context, a, b) => DetailManual(
                                infoManual: infomanual[index],
                              )));
                },
                child: Stack(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        SizedBox(
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
                                  infomanual[index].icon,
                                  height: 250,
                                ),
                                Text(
                                  infomanual[index].nama,
                                  style: TextStyle(
                                    fontFamily: 'Avenir',
                                    fontSize: 30,
                                    color: Color.fromARGB(255, 251, 250, 255),
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                                Text(
                                  infomanual[index].harga,
                                  style: TextStyle(
                                    fontFamily: 'Avenir',
                                    fontSize: 20,
                                    color: Color.fromARGB(255, 251, 250, 255),
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                                SizedBox(
                                  height: 11,
                                ),
                                Row(
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
