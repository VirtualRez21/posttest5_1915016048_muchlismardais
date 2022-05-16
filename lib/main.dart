// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_interpolation_to_compose_strings, unused_import, sized_box_for_whitespace, avoid_print

import 'package:flutter/material.dart';
import 'package:posttest5_1915016048_muchlismardais/detailsPage.dart';
import 'package:posttest5_1915016048_muchlismardais/splashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  Widget gambar(String path, String judul, BuildContext konteks, String desk,
      String harga) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(17.0),
              border: Border.all(
                color: Color(0xff2e9db4),
                width: 3,
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(17.0),
              child: Image(
                image: AssetImage('assets/' + path),
                height: 240,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            width: 170,
            child: ElevatedButton(
              style: TextButton.styleFrom(
                backgroundColor: Color(0xff2e9db4),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              onPressed: () {
                Navigator.of(konteks).push(MaterialPageRoute(
                    builder: (context) => DetailPage(
                          foto: path,
                          judul: judul,
                          harga: harga,
                          deskripsi: desk,
                        )));
              },
              child: Text(
                judul,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xffffffff),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget gambarHeader() {
    return Container(
      child: Image(
        image: AssetImage('assets/Gramedia.png'),
        height: 150,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget teksHeader(String teks) {
    return Container(
        child: Text(
      teks,
      style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          wordSpacing: 10,
          decoration: TextDecoration.overline),
      textAlign: TextAlign.center,
    ));
  }

  Future alertNotif(
      BuildContext konteks, String teks1, String teks2, String teks3) {
    return showDialog(
      context: konteks,
      builder: (ctx) => AlertDialog(
        title: Text(teks1),
        content: Text(teks2),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(ctx).pop();
            },
            child: Text(teks3),
          ),
        ],
      ),
    );
  }

  void showSnackBar(BuildContext context, String teks) {
    final snackBar = SnackBar(content: Text(teks));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gramedia Digital | Posttest 5',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}
