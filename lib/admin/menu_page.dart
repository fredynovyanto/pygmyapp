import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:pygmyapp_menu/admin/add_menu.dart';
import 'package:pygmyapp_menu/admin/edit_menu.dart';
import 'package:pygmyapp_menu/drawer_widget.dart';
import 'package:pygmyapp_menu/models/menu_model.dart';
import 'package:pygmyapp_menu/provider/menu_provider.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    MenuProvider menuProvider = context.read<MenuProvider>();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Pygmy Owl Coffee",
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.brown,
        elevation: 0.0,
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot<Menu>>(
          stream: menuProvider.streamMenu(),
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
                  Menu menu = allMenu[index];
                  return Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16),
                            child: Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(menu.image))),
                            ),
                          ),
                          Expanded(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                menu.name,
                                style: GoogleFonts.montserrat(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                menu.description,
                                textAlign: TextAlign.left,
                                style: GoogleFonts.montserrat(
                                  fontSize: 13,
                                ),
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Rp ${menu.price}",
                                    style: GoogleFonts.montserrat(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Row(
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            Navigator.push(context,
                                                MaterialPageRoute(
                                                    builder: (context) {
                                              return EditMenu(menu: menu);
                                            }));
                                          },
                                          icon: const Icon(
                                            Icons.edit_square,
                                            color: Colors.brown,
                                          )),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      IconButton(
                                          onPressed: () async {
                                            if (await confirm(
                                              context,
                                              title: const Text('Confirm'),
                                              content: const Text(
                                                  'Are you sure to delete this menu?'),
                                              textOK: const Text('Yes'),
                                              textCancel: const Text('No'),
                                            )) {
                                              bool hapus = await menuProvider
                                                  .deleteMenu(menu.menuId);
                                              (!hapus)
                                                  ? ScaffoldMessenger.of(
                                                          context)
                                                      .showSnackBar(
                                                          const SnackBar(
                                                      content: Text(
                                                          "Can't delete menu"),
                                                    ))
                                                  : ScaffoldMessenger.of(
                                                          context)
                                                      .showSnackBar(
                                                          const SnackBar(
                                                      content: Text(
                                                          "Menu successfully deleted"),
                                                    ));
                                            }
                                          },
                                          icon: const Icon(
                                            Icons.delete,
                                            color: Colors.red,
                                          )),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ))
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Divider(),
                      ),
                    ],
                  );
                });
          }),
      drawer: const DrawerWidget(),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const AddMenu();
            }));
          },
          child: const Icon(Icons.add)),
    );
  }
}
