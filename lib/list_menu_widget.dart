import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:pygmyapp_menu/models/menu_model.dart';
import 'package:pygmyapp_menu/provider/card_provider.dart';
import 'package:pygmyapp_menu/provider/menu_provider.dart';

class ListMenuWidget extends StatelessWidget {
  const ListMenuWidget({super.key});

  @override
  Widget build(BuildContext context) {
    MenuProvider menuProvider = context.read<MenuProvider>();
    return StreamBuilder<QuerySnapshot<Menu>>(
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
          return Expanded(
            child: ListView.builder(
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
                                height: 16,
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
                                height: 12,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                            Provider.of<CartProvider>(context,
                                                    listen: false)
                                                .removeCart(
                                                    menu.name, menu.menuId);
                                          },
                                          icon: const Icon(
                                            Icons.remove_circle,
                                            color: Colors.red,
                                          )),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Consumer<CartProvider>(
                                        builder: (context, value, _) {
                                          var id = value.cart.indexWhere(
                                              (element) =>
                                                  element.menuId ==
                                                  allMenu[index].menuId);

                                          return Text(
                                            (id == -1)
                                                ? "0"
                                                : value.cart[id].quantity
                                                    .toString(),
                                            textAlign: TextAlign.left,
                                            style: GoogleFonts.montserrat(
                                                fontSize: 15),
                                          );
                                        },
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      IconButton(
                                          onPressed: () {
                                            Provider.of<CartProvider>(context,
                                                    listen: false)
                                                .addCart(menu.name, menu.menuId);
                                          },
                                          icon: const Icon(
                                            Icons.add_circle,
                                            color: Colors.green,
                                          )),
                                    ],
                                  )
                                ],
                              )
                            ],
                          )),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Divider(),
                      ),
                    ],
                  );
                }),
          );
        });
  }
}
