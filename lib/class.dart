import 'package:flutter/material.dart';

class InfoMenu {final int position;
final String icon;
  final String nama;
  final String harga;
  final String detail;
  final List<String> gambar;

  InfoMenu(
    this.position, {
       required this.icon,   
       required this.nama,
       required this.detail,
       required this.harga,
       required this.gambar
      });
}
List<InfoMenu> infomenu = [
  InfoMenu(1,
  icon: "asset/espresso.png",
    nama: 'Espresso',
    detail: 
      "Espresso adalah salah satu minuman yang dibuat menggunakan kopi yang dihaluskan dan diesktrak menggunakan mesin dengan air bertekanan tinggi",
    harga: "Rp 12.000",
    gambar: [ 
      'asset/espresso.png',
     

    ]),
    
    InfoMenu(2,
    icon: "asset/cappucino.png",
    nama: 'Cappucino',
    detail: 
      "Cappucino merupakan salah satu minuman yang dibuat dengan mencampurkan espresso dengan dan krim, Cappucino memiliki 3 layer berbeda yaitu Espresso ada dilapisan paling bawah, lalu susu di layer tengah dan foam dilayer paling atas",
    harga: "Rp 20.000",
    gambar: [ 
      'asset/cappucino.png',
    ]),

    InfoMenu(3,
    icon: "asset/flatwhite.png",
    nama: 'Flat White',
    detail: 
      "Flat White memiliki komposisi layer yang sama seperti Cappucino namun, foam yang terdapat pada Flat White jauh lebih tipis ",
    harga: "Rp 20.000",
    gambar: [ 
      'asset/flatwhite.png',
    ]),

    InfoMenu(4,
    icon: "asset/cafelatte.png",
    nama: 'Cafe Latte',
    detail: 
      "Cafe Latte memiliki komposisi yang sama persis seperti Cappucino dan Flat White namun yang membedakan dengan kedua jenis minuman ini adalah Cafe Latte memiliki komposisi yang jauh lebih banyak sehingga rasa kopi tidak terlalu intens.",
    harga: "Rp 20.000",
    gambar: [ 
      'asset/cafelatte.png',
    ]),

    InfoMenu(5,
    icon: "asset/americano.png",
    nama: 'Americano',
    detail: 
      "Americano merupakan minuman yang terbuat dari campuran dari espresso dan air",
    harga: "Rp 18.000",
    gambar: [ 
      'asset/americano.png',
      'asset/americano1.png'
    ]),
     InfoMenu(6,
    icon: "asset/moccachino.png",
    nama: 'Moccachino',
    detail: 
      "Moccachino merupakan salah satu minuman espresso based yang pembuatannya mencampurkan antara espresso, susu dengan coklat",
    harga: "Rp 23.000",
    gambar: [ 
      'asset/moccachino.png',
    ]),
    InfoMenu(7,
    icon: "asset/machiato.png",
    nama: 'Machiato',
    detail: 
      "machiato classic merupakan minuman yang memiliki 2 layer yaitu layer pertama yang terdiri dari espresso dan layer kedua berupa foam.",
    harga: "Rp 18.000",
    gambar: [ 
      'asset/machiato.png',
    ]),
];



class Item1 extends StatelessWidget {
  const Item1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.3, 1],
          colors: [Colors.white,Colors.white,]
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            'asset/pygmy1.png',
            height: 180.0,
            fit: BoxFit.cover,
          )
        ],
      ),
    );
  }
}

class Item2 extends StatelessWidget {
  const Item2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.3, 1],
           colors: [Colors.white,Colors.white,]
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            'asset/pygmy2.png',
            height: 180.0,
            fit: BoxFit.cover,
          )
        ],
      ),
    );
  }
}


class Item3 extends StatelessWidget {
  const Item3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.3, 1],
           colors: [Colors.white,Colors.white,]
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            'asset/pygmy3.png',
            height: 180.0,
            fit: BoxFit.cover,
          )
        ],
      ),
    );
  }
}

class Item4 extends StatelessWidget {
  const Item4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.3, 1],
          colors: [Colors.white,Colors.white,]
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            'asset/pygmy4.png',
            height: 180.0,
            fit: BoxFit.cover,
          )
        ],
      ),
    );
  }
}
