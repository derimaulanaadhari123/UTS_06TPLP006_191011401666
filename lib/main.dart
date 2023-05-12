import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UTS ',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHome(),
    );
  }
}

class Shoes {
  late String nama;
  late String tipe;
  late String harga;
  late String image;
  late Color warna;

  Shoes(
      {required this.nama,
      required this.tipe,
      required this.harga,
      required this.image,
      required this.warna});
}

class MyHome extends StatelessWidget {
  // const MyHome({super.key});
  List<Shoes> shoes = [
    Shoes(
        nama: "Nike SB Zoom Blazer",
        tipe: "Mod Premium",
        harga: "8, 795",
        image: "assets/shoes/sepatu-1.png",
        warna: Colors.amber),
    Shoes(
        nama: "Nike Air Zoom Pegasus",
        tipe: "Mens Road Running Shoes",
        harga: "9,995",
        image: "assets/shoes/sepatu-2.png",
        warna: Colors.blueAccent),
    Shoes(
        nama: "Nike ZoomX Vaporfly",
        tipe: "Mens Road Racing Shoes",
        harga: "19,695",
        image: "assets/shoes/sepatu-3.png",
        warna: Colors.redAccent),
    Shoes(
        nama: "Nike Air Force 1 850",
        tipe: "Older Kids Shoe",
        harga: "6,295",
        image: "assets/shoes/sepatu-4.png",
        warna: Colors.greenAccent),
    Shoes(
        nama: "Nike Waffle One",
        tipe: "Mens Shoes",
        harga: "8,295",
        image: "assets/shoes/sepatu-5.png",
        warna: Colors.purpleAccent),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Shoes",
          style: GoogleFonts.getFont(
            'Poppins',
            textStyle: TextStyle(
                color: Colors.black,
                fontSize: 40,
                fontWeight: FontWeight.normal),
          ),
        ),
        actions: [
          Container(
            height: 65,
            width: 65,
            margin: EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
                color: Colors.amber,
                image: DecorationImage(
                  image: new AssetImage("assets/profile/profile.jpg"),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(30)),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 50, right: 50, top: 50),
        child: ListView.builder(
            itemCount: shoes.length,
            itemBuilder: (BuildContext context, int index) {
              return CardShoes(
                nama: shoes[index].nama,
                tipe: shoes[index].tipe,
                harga: shoes[index].harga,
                image: shoes[index].image,
                warna: shoes[index].warna,
              );
            }),
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Shoes",
            style: GoogleFonts.getFont('Poppins',
                textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 40,
                    fontWeight: FontWeight.normal))),
        Container(
          height: 65,
          width: 65,
          decoration: BoxDecoration(
              color: Colors.amber,
              image: const DecorationImage(
                image: NetworkImage(
                    'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(30)),
        )
      ],
    );
  }
}

class CardShoes extends StatelessWidget {
  late String nama;
  late String tipe;
  late String harga;
  late String image;
  late Color warna;

  CardShoes(
      {required this.nama,
      required this.tipe,
      required this.harga,
      required this.image,
      required this.warna});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      margin: EdgeInsets.only(bottom: 30),
      width: double.infinity,
      decoration: BoxDecoration(
        color: warna,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 20),
              height: 120,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${nama}',
                      style: GoogleFonts.getFont(
                        'Poppins',
                        textStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                    Text(
                      '${tipe}',
                      style: GoogleFonts.getFont(
                        'Poppins',
                        textStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Text(
                      '\$ ${harga}',
                      style: GoogleFonts.getFont(
                        'Poppins',
                        textStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                  ]),
            ),
            Container(
              margin: EdgeInsets.only(right: 10),
              height: 130,
              width: 230,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: new AssetImage("${image}"),
                  fit: BoxFit.cover,
                ),
              ),
            )
          ]),
    );
  }
}
