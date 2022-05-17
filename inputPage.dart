// ignore_for_file: file_names, prefer_const_constructors, unnecessary_new, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:posttest5_1915016048_muchlismardais/main.dart';

class InputDataPage extends StatefulWidget {
  const InputDataPage({Key? key}) : super(key: key);

  @override
  State<InputDataPage> createState() => _InputDataPageState();
}

enum Bahasa { unknown, english, indonesia }

class _InputDataPageState extends State<InputDataPage> {
  Widget judulKolomTabel(String title) {
    return Text(
      title,
      textAlign: TextAlign.center,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
    );
  }

  Widget isiKolomTabel(String isi) {
    return Text(
      isi,
      textAlign: TextAlign.center,
    );
  }

  Widget tempatInput(TextCapitalization kapital, final ctrl, TextInputType type,
      List<TextInputFormatter> format, String label, String hint, Widget ikon) {
    return Container(
        margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
        child: TextFormField(
            textCapitalization: kapital,
            controller: ctrl,
            keyboardType: type,
            inputFormatters: format,
            decoration:
                InputDecoration(labelText: label, hintText: hint, icon: ikon)));
  }

  String namaBuku = "";
  String penulisBuku = "";
  String penerbitBuku = "";
  String deskripsiBuku = "";
  String isbnBuku = "";
  String hargaBuku = "";
  String jumlahHalamanBuku = "";
  String language = "";

  final namaBukuCtrl = TextEditingController();
  final penulisBukuCtrl = TextEditingController();
  final penerbitBukuCtrl = TextEditingController();
  final deskripsiBukuCtrl = TextEditingController();
  final isbnBukuCtrl = TextEditingController();
  final hargaBukuCtrl = TextEditingController();
  final jumlahHalamanBukuCtrl = TextEditingController();

  Bahasa bahasa = Bahasa.unknown;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    namaBukuCtrl.dispose();
    penerbitBukuCtrl.dispose();
    deskripsiBukuCtrl.dispose();
    isbnBukuCtrl.dispose();
    hargaBukuCtrl.dispose();
    jumlahHalamanBukuCtrl.dispose();
    super.dispose();
  }

  String getBahasa(Bahasa? value) {
    if (value == Bahasa.english) {
      return "English";
    } else if (value == Bahasa.indonesia) {
      return "Indonesia";
    }
    return "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("Input Buku", style: TextStyle(fontSize: 16.0)),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[Colors.orangeAccent, Colors.blue])),
        ),
      ),
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Column(
            children: [
              MyApp().gambarHeader(),
              MyApp().teksHeader("Input Data Buku"),
              Container(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                child: Column(
                  children: [
                    tempatInput(
                        TextCapitalization.words,
                        namaBukuCtrl,
                        TextInputType.name,
                        [FilteringTextInputFormatter.singleLineFormatter],
                        "Nama Buku",
                        "Isi Nama Buku",
                        Icon(Icons.book)),
                    tempatInput(
                        TextCapitalization.words,
                        penulisBukuCtrl,
                        TextInputType.name,
                        [FilteringTextInputFormatter.singleLineFormatter],
                        "Penulis Buku",
                        "Isi Penulis Buku",
                        Icon(Icons.person)),
                    tempatInput(
                        TextCapitalization.words,
                        penerbitBukuCtrl,
                        TextInputType.name,
                        [FilteringTextInputFormatter.singleLineFormatter],
                        "Penerbit Buku",
                        "Isi Penerbit Buku",
                        Icon(Icons.home)),
                    Container(
                        margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                        child: TextFormField(
                            textCapitalization: TextCapitalization.sentences,
                            controller: deskripsiBukuCtrl,
                            maxLines: 2,
                            decoration: InputDecoration(
                                labelText: "Deskripsi Buku",
                                hintText: "Isi Deskripsi Buku",
                                icon: Icon(Icons.description)))),
                    tempatInput(
                        TextCapitalization.none,
                        isbnBukuCtrl,
                        TextInputType.number,
                        [FilteringTextInputFormatter.digitsOnly],
                        "ISBN Buku",
                        "Isi ISBN Buku",
                        Icon(Icons.copyright)),
                    tempatInput(
                        TextCapitalization.none,
                        hargaBukuCtrl,
                        TextInputType.number,
                        [FilteringTextInputFormatter.digitsOnly],
                        "Harga Buku (Rp)",
                        "Isi Harga Buku",
                        Icon(Icons.monetization_on)),
                    tempatInput(
                        TextCapitalization.none,
                        jumlahHalamanBukuCtrl,
                        TextInputType.number,
                        [FilteringTextInputFormatter.digitsOnly],
                        "Jumlah Halaman Buku",
                        "Isi Jumlah Halaman Buku",
                        Icon(Icons.numbers)),
                    Container(
                      margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                      child: Text(
                        "Bahasa Buku:",
                        style: TextStyle(
                          fontSize: 15,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    ListTile(
                      title: const Text("English"),
                      leading: Radio(
                        groupValue: bahasa,
                        value: Bahasa.english,
                        onChanged: (Bahasa? value) {
                          setState(() {
                            bahasa = value!;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: const Text("Indonesia"),
                      leading: Radio(
                        groupValue: bahasa,
                        value: Bahasa.indonesia,
                        onChanged: (Bahasa? value) {
                          setState(() {
                            bahasa = value!;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 120,
                      height: 35,
                      margin: const EdgeInsets.only(
                          top: 10.0, bottom: 10.0, right: 5),
                      child: ElevatedButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Color(0xff2e9db4),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                        onPressed: () {
                          MyApp()
                              .showSnackBar(context, "Tabel Berhasil Direset");
                          setState(() {
                            namaBuku = "";
                            penulisBuku = "";
                            penerbitBuku = "";
                            deskripsiBuku = "";
                            isbnBuku = "";
                            hargaBuku = "";
                            jumlahHalamanBuku = "";
                            language = "";
                          });
                        },
                        child: Text(
                          "Reset Tabel",
                          style: TextStyle(
                            color: Color(0xffffffff),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 120,
                      height: 35,
                      margin: const EdgeInsets.only(
                          top: 10.0, bottom: 10.0, left: 5),
                      child: ElevatedButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Color(0xff2e9db4),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                        onPressed: () {
                          MyApp()
                              .showSnackBar(context, "Data Berhasil Disimpan");
                          setState(() {
                            namaBuku = namaBukuCtrl.text;
                            penulisBuku = penulisBukuCtrl.text;
                            penerbitBuku = penerbitBukuCtrl.text;
                            deskripsiBuku = deskripsiBukuCtrl.text;
                            isbnBuku = isbnBukuCtrl.text;
                            hargaBuku = hargaBukuCtrl.text;
                            jumlahHalamanBuku = jumlahHalamanBukuCtrl.text;
                            language = '${getBahasa(bahasa)}';
                          });
                        },
                        child: Text(
                          "Simpan Buku",
                          style: TextStyle(
                            color: Color(0xffffffff),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Table(
                border: TableBorder.lerp(
                    TableBorder(top: BorderSide(width: 3, color: Colors.black)),
                    TableBorder(
                        bottom: BorderSide(width: 3, color: Colors.green)),
                    0.5),
                children: [
                  TableRow(children: [
                    judulKolomTabel("Nama"),
                    judulKolomTabel("Penulis"),
                    judulKolomTabel("Penerbit"),
                    judulKolomTabel("Desk"),
                    judulKolomTabel("ISBN"),
                    judulKolomTabel("Hrg (Rp)"),
                    judulKolomTabel("Jml. Hal"),
                    judulKolomTabel("Bhsa"),
                  ]),
                  TableRow(children: [
                    isiKolomTabel("$namaBuku"),
                    isiKolomTabel("$penulisBuku"),
                    isiKolomTabel("$penerbitBuku"),
                    isiKolomTabel("$deskripsiBuku"),
                    isiKolomTabel("$isbnBuku"),
                    isiKolomTabel("$hargaBuku"),
                    isiKolomTabel("$jumlahHalamanBuku"),
                    isiKolomTabel("$language"),
                  ])
                ],
              ),
              SizedBox(
                height: 10,
              )
            ],
          )
        ],
      ),
    );
  }
}
