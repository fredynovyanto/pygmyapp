import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:pygmyapp_menu/list_menu_widget.dart';
import 'package:pygmyapp_menu/provider/card_provider.dart';
import 'package:badges/badges.dart' as badges;
import 'package:url_launcher/url_launcher.dart';

import 'class.dart';

List cardList = [
  const Item1(),
  const Item2(),
  const Item3(),
  const Item4(),
];

List<T> map<T>(List list, Function handler) {
  List<T> result = [];
  for (var i = 0; i < list.length; i++) {
    result.add(handler(i, list[i]));
  }
  return result;
}

class Home extends StatelessWidget {
  Home({super.key});
  TextEditingController namaController = TextEditingController();
  TextEditingController nomorMejaController = TextEditingController();


  Future<void> openDialog(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: SizedBox(
            height: 280,
            child: Column(
              children: [
                Text(
                  "Nama",
                  style: GoogleFonts.montserrat(),
                ),
                TextFormField(
                  controller: namaController,
                  decoration:
                      const InputDecoration(border: OutlineInputBorder()),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Nomor Meja",
                  style: GoogleFonts.montserrat(),
                ),
                TextFormField(
                  controller: nomorMejaController,
                  decoration:
                      const InputDecoration(border: OutlineInputBorder()),
                ),
                const SizedBox(
                  height: 20,
                ),
                Consumer<CartProvider>(builder: (context, value, _) {
                  String strPesanan = "";
                  for (var element in value.cart) {
                    strPesanan =
                        "$strPesanan\n${element.name} ( ${element.quantity} )";
                  }
                  return ElevatedButton(
                      onPressed: () async {
                        String pesanan =
                            "Nama : ${namaController.text}\nNomor Meja : ${nomorMejaController.text}\nPesanan : \n$strPesanan";

                        Uri whatsappUrl = Uri.parse(
                            "whatsapp://send?phone=6281912810006&text=$pesanan");
                        try {
                          launchUrl(whatsappUrl);
                        } catch (e) {
                          print(e);
                        }
                      },
                      child: const Text("Pesan Sekarang"));
                }),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        openDialog(context);
      }, child: Consumer<CartProvider>(
        builder: (context, value, child) {
          return (value.total > 0)
              ? badges.Badge(
                  badgeContent: Text(
                    (value.total > 0) ? value.total.toString() : "",
                    style: GoogleFonts.montserrat(color: Colors.white),
                  ),
                  child: const Icon(Icons.shopping_bag),
                )
              : const Icon(Icons.shopping_bag);
        },
      )),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CarouselSlider(
                options: CarouselOptions(
                  height: 200.0,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  pauseAutoPlayOnTouch: true,
                  aspectRatio: 2.0,
                  onPageChanged: (index, reason) {},
                ),
                items: cardList.map((card) {
                  return Builder(builder: (BuildContext context) {
                    return Container(
                      height: MediaQuery.of(context).size.height * 0.30,
                      width: MediaQuery.of(context).size.width,
                      child: Card(
                        color: Colors.blueAccent,
                        child: card,
                      ),
                    );
                  });
                }).toList(),
              ),
              const Text(
                "Mau ngopi apa hari ini?",
                textAlign: TextAlign.left,
                style: TextStyle(color: Colors.black, fontSize: 25.0),
              ),
              const Divider(),
              const ListMenuWidget(),
            ]),
      ),
    );
  }
}
