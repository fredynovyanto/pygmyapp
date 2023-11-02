class InfoKopsu {
  final int position;
  final String icon;
  final String nama;
  final String harga;
  final String detail;
  final List<String> gambar;

  InfoKopsu(this.position,
      {required this.icon,
      required this.nama,
      required this.detail,
      required this.harga,
      required this.gambar});
}

List<InfoKopsu> infokopsu = [
  InfoKopsu(1,
      icon: "asset/superficial.png",
      nama: 'Superficial',
      detail:
          "Kopi susu Superficial adalah kopi susu yang menggunakan gula aren dan hanya menggunakan satu jenis biji kopi robusta dalam pembuatannya sehingga rasanya cenderung strong dan memiliki rasa manis",
      harga: "Rp 13.000",
      gambar: [
        'asset/superficial.png',
      ]),
  InfoKopsu(2,
      icon: "asset/superficial.png",
      nama: 'Profundal',
      detail:
          "Profundal adalah kopi susu yang hampir mirip seperti Superficial, hanya saja Profundal menggunakan jenis kopi blend pada espressonya yaitu robusta dan arabica sehingga menghasilkan rasa yang cenderung balance dan manis",
      harga: "Rp 17.000",
      gambar: [
        'asset/superficial.png',
      ]),
  InfoKopsu(3,
      icon: "asset/superficial.png",
      nama: 'Kopsu Pandan',
      detail:
          "Kopsu Pandan adalah jenis kopsu seperti Profundal namun menggunakan tambahan simple sirup buatan sendiri dari daun pandan ",
      harga: "Rp 19.000",
      gambar: [
        'asset/superficial.png',
      ]),
  InfoKopsu(4,
      icon: "asset/superficial.png",
      nama: 'Kopsu Buttersctoch',
      detail:
          "Kopsu jenis ini memiliki rasa yang unik karna kopi susu jenis ini menggunakan sirup butterscotch dimana sirup tersebut memberikan rasa yang sedikit gurih dan manis pada minuman ini",
      harga: "Rp 19.000",
      gambar: [
        'asset/superficial.png',
      ]),
  InfoKopsu(5,
      icon: "asset/superficial.png",
      nama: 'Kopsu Caramel',
      detail:
          "Kopsu jenis ini sangat cocok bagi mereka yang ingin meminum kopi susu namun tidak ingin merasakan pahit sedikitpun pada kopisusu yang dipesan, hal tersebut karna adanya tambahan sirum caramel yang membuat rasa manis lebih dominan pada kopsu ini",
      harga: "Rp 19.000",
      gambar: [
        'asset/superficial.png',
      ]),
  InfoKopsu(6,
      icon: "asset/superior.png",
      nama: 'Superior',
      detail:
          "Kopsu ini merupakan kopi susu dengan rasa terunik karna kopi susu ini memiliki rasa seperti melon dan creamy saat diminum, dinamakan superior karna pada saat perkenalan minuman ini sangat sering dipesan",
      harga: "Rp 20.000 ",
      gambar: [
        'asset/superior.png',
      ]),
];
