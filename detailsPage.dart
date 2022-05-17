// ignore_for_file: file_names, use_key_in_widget_constructors, prefer_const_constructors, duplicate_ignore, sized_box_for_whitespace, sort_child_properties_last, must_be_immutable, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:posttest5_1915016048_muchlismardais/main.dart';

class DetailPage extends StatefulWidget {
  String foto, judul, harga, deskripsi;
  DetailPage(
      {Key? key,
      required this.foto,
      required this.judul,
      required this.harga,
      required this.deskripsi})
      : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Detail Page"),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              Expanded(
                  child: Container(
                // ignore: prefer_const_constructors
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.only(
                      // ignore: prefer_const_constructors
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40),
                    ),
                    image: DecorationImage(
                      image: AssetImage("assets/" + widget.foto),
                    )),
              )),
              Expanded(
                  child: Container(
                color: Colors.white,
                child: ListView(
                  children: [
                    ListTile(
                      title: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.judul,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Rp." + widget.harga,
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w600),
                              ),
                              Container(
                                height: 40,
                                width: 90,
                                decoration: BoxDecoration(
                                    color: Colors.amber,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: IconButton(
                                          onPressed: () {},
                                          icon: Icon(Icons.remove)),
                                    ),
                                    Text("1"),
                                    Expanded(
                                      child: IconButton(
                                          onPressed: () {},
                                          icon: Icon(Icons.add)),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Text(
                            "Deskripsi",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            widget.deskripsi,
                            style: TextStyle(fontSize: 16),
                            textAlign: TextAlign.justify,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )),
            ],
          ),
        ),
        bottomNavigationBar: Material(
          child: Container(
            margin: EdgeInsets.all(15.0),
            height: 40,
            child: ElevatedButton(
              child: Text(
                'Beli Buku',
                style: TextStyle(fontSize: 20.0),
              ),
              onPressed: () {
                MyApp().alertNotif(context, "Pemberitahuan!",
                    "Fitur Beli Buku Belum Tersedia. :(", "Ok");
              },
            ),
          ),
          color: Colors.transparent,
        ));
  }
}
