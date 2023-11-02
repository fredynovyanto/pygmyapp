import 'package:flutter/material.dart';
import 'package:pygmyapp_menu/drawer_widget.dart';


class About extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar (
        title: Text("Pygmy Owl Coffee"),
        backgroundColor: Colors.brown,
        elevation: 0.0,
        centerTitle: true,
      ),
      body: Stack(
        children: <Widget> [
          Container(
  decoration: BoxDecoration(
    image: DecorationImage(
      image: AssetImage(
          'asset/pygmy.png'),
      fit: BoxFit.fitHeight,
    ),
  ),
),

          Positioned(
            bottom: 48.0,
            left: 10.0,
            right: 10.0,
            child: Card(
              color: Colors.black.withOpacity(0.3),
              elevation: 8.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      "Tentang Aplikasi", 
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 0, left: 16.0, right: 16.0, bottom: 8.0),
                    child: Text(
                        "Hi ,Selamat datang di aplikasi Pygmy Owl Coffee. Aplikasi ini adalah sebuah wujud kecintaan kami terhadap kopi dan komitmen kami agar kopi dapat diminati oleh seluruh kalangan masyarakat",
                        textAlign: TextAlign.center,
                       style: TextStyle(
                        color: Colors.white,
                      ),
              ),
                  ),
                  
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 8.0, left: 16.0, right: 16.0, bottom: 32.0),
                    child: Text("Pygmy Owl Coffee Family",style: TextStyle(
              color: Colors.white
              ),
              ),
                  )
                ]
                  ),
        
              )
          )
            ]
          ),
      drawer: const DrawerWidget(),
    );
  }
}