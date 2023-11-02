import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pygmyapp_menu/detail_menu.dart';
import 'package:pygmyapp_menu/detailkopsu.dart';
import 'package:pygmyapp_menu/drawer_widget.dart';
import 'package:pygmyapp_menu/models/menu_model.dart';
import 'package:pygmyapp_menu/provider/menu_provider.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key, required this.category});
  final String category;

  @override
  Widget build(BuildContext context) {
    MenuProvider menuProvider = context.read<MenuProvider>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pygmy Owl Coffee"),
        backgroundColor: Colors.brown,
        elevation: 0.0,
        centerTitle: true,
      ),
      body: Container(
        height: 850,
        padding: const EdgeInsets.all(35),
        child: StreamBuilder<QuerySnapshot<Menu>>(
          stream: menuProvider.getMenu(category),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (!snapshot.hasData) {
                return const Center(
                  child: Text("No data"),
                );
              }
              if (snapshot.hasError) {
                return const Center(
                  child: Text("Error! Can't get data"),
                );
              }
              List<Menu> allMenu = [];

              for (var element in snapshot.data!.docs) {
                allMenu.add(element.data());
              }

              if (allMenu.isEmpty) {
                return const Center(
                  child: Text("No data"),
                );
              }
            return ListView.builder(
                itemCount: allMenu.length,
                itemBuilder: (context, index) {
                  final menu = allMenu[index];
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageRouteBuilder(
                              pageBuilder: (context, a, b) => DetailMenu(
                                    menu: menu,
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
                                    Container(
                                      height: 250,
                                      decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(menu.image))),
                                    ),
                                    Text(
                                      menu.name,
                                      style: const TextStyle(
                                        fontFamily: 'Avenir',
                                        fontSize: 30,
                                        color: Color.fromARGB(255, 251, 250, 255),
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                    Text(
                                      menu.price.toString(),
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
                });
          }
        ),
      ),
      drawer: const DrawerWidget(),
    );
  }
}