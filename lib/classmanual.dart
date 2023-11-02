

class InfoManual{final int position;
final String icon;
  final String nama;
  final String harga;
  final String detail;
  final List<String> gambar;

  InfoManual(
    this.position, {
       required this.icon,   
       required this.nama,
       required this.detail,
       required this.harga,
       required this.gambar
      });
}
List<InfoManual> infomanual = [
  InfoManual(1,
  icon: "asset/vietnamdrip3.png",
    nama: 'Vietnam Drip',
    detail: 
      "Vietnam drip adalah metode dan alat seduh yang menghasilkan minuman dengan cara ekstraksi lewat tetesan. Dripper berbentuk seperti gelas metal dan terdiri dari tabung, plunger, dan tutup metal. Penggunaannya sangat mudah, setelah bubuk kopi dimasukkan, masukkan plunger lalu tekan, taruh dripper di atas gelas, lalu tuang air panas.",
    harga: "Rp 15.000",
    gambar: [ 
      'asset/vietnamdrip.png',
      'asset/vietnamdrip1.png',
      'asset/vietnamdrip2.png',
      'asset/vietnamdrip3.png',
     

    ]),
    
    InfoManual(2,
    icon: "asset/pourover1.png",
    nama: 'Pour Over V60',
    detail: 
      "Pour over dapat dimaknai sebagai metode menyeduh kopi dengan cara menuangkan (pour) air panas ke filter atau penyaring berisi bubuk kopi. Penyaringnya bisa berbahan kertas, kain, atau metal. Melalui pour over, tingkat ekstraksi kopi dapat dikontrol. Keseimbangan rasanya bisa diatur sesuai selera. Antara keasaman atau rasa manis dari kopi misalnya, juga ketebalan, atau sekadar mengurangi kepahitannya. ",
    harga: "Rp 20.000",
    gambar: [ 
      'asset/v60.png',
      'asset/pourover1.png',
      'asset/pourover2.png',
      'asset/pourover3.png',
    ]),

];
