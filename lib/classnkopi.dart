

class InfonKopi {final int position;
final String icon;
  final String nama;
  final String harga;
  final String detail;
  final List<String> gambar;

  InfonKopi(
    this.position, {
       required this.icon,   
       required this.nama,
       required this.detail,
       required this.harga,
       required this.gambar
      });
}
List<InfonKopi> infonKopi= [
  InfonKopi(1,
  icon: "asset/coklat ice.png",
    nama: 'Coklat',
    detail: 
      "Coklat ice/hot adalah minuman yang tepat bagi kalian yang mencari minuman alternatif selain kopi, minuman ini terbuat dari bubuk coklat yang dilarutkan serta diberi tambahan susu lalu di kocok dan ditambahkan es batu",
    harga: "Rp 18.000",
    gambar: [ 
      'asset/coklat ice.png',
     

    ]),
    
    InfonKopi(2,
    icon: "asset/lycheetea1.png",
    nama: 'Lychee tea',
    detail: 
      "Lychee tea merupakan salah satu minuman yang memadukan antara teh dengan buah leci. Dikutip dari Organic Facts, teh leci memiliki gizi yang baik, dengan kalium yang tinggi dan jumlah yang baik dari senyawa polifenol, flavonoid, dan beta-karoten, serta vitamin C dan B. ",
    harga: "Rp 15.000",
    gambar: [ 
      'asset/lycheetea.png',
      'asset/lycheetea1.png',
      'asset/lycheetea2.png',
      'asset/lycheetea3.png',
    ]),

    InfonKopi(3,
    icon: "asset/lemongrass.png",
    nama: 'Lemon Grass',
    detail: 
      "Lemongrass atau banyak dikenal masyarakat dengan sebutan teh serai, juga digunakan sebagai pengobatan karena kegunaannya untuk menyembuhkan demam, arthritis, sakit perut, pencernaan, sakit kepala dan masalah penyakit lainnya. Minuman ini sangat cocok diminum ketika siang hari untuk melepas dahaga sekaligus sebagai refreshment ",
    harga: "Rp 19.000",
    gambar: [ 
      'asset/lemongrass.png',
      'asset/lemongrass1.png'
    ]),

    InfonKopi(4,
    icon: "asset/lemonsquash1.png",
    nama: 'Lemon Squash',
    detail: 
      "Lemon & Orange Squash merupakan minuman berbahan dasar lemon dan jeruk orange yang dipadukan bersama soda serta es batu yang menyegarkan tenggorokan.",
    harga: "Rp 19.000",
    gambar: [ 
      'asset/lemonsquash1.png',
      'asset/lemonsquash2.png',
      'asset/lemonsquash3.png'
    ]),

    InfonKopi(5,
    icon: "asset/lycheesquash.png",
    nama: 'Lychee Squash',
    detail: 
      "Lychee squash merupakan minuman yang hampir mirip seperti Lemon squash hanya saja minuman ini menggunakan tambahan buah lemon",
    harga: "Rp 19.000",
    gambar: [ 
      'asset/lycheesquash.png',
    ]),
    InfonKopi(6,
    icon: "asset/virginmojito.png",
    nama: 'Virgin Mojito',
    detail: 
      "Mojito sebenarnya adalah minuman jenis cocktail yang cita rasanya merupakan kombinasi rasa manis dari sirup, rasa segar dari potongan buah, dan rasa khas yang hangat dari daun mint, Mojito merupakan minuman koktail tradisional Kuba. Koktail ini memiliki rasa asam segar karena menggunakan air jeruk nipis dan mint. Minuman ini bisa jadi pilihan tepat dalam mengatasi udara panas menyengat",
    harga: "Rp 20.000 ",
    gambar: [ 
      'asset/virginmojito.png',
      'asset/virginmojito1.png',
      'asset/virginmojito2.png',
    ]),
];


