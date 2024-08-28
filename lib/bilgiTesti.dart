// ignore: file_names
import 'package:flutter/material.dart';
import 'package:bilgi_testi/constants.dart';
import 'package:bilgi_testi/test_veri.dart';
import 'package:alert_dialog/alert_dialog.dart';

class BilgiTesti extends StatelessWidget {
  const BilgiTesti({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: Colors.white,
              title: Text(
                'Bilgi Testi Soruları',
                style: TextStyle(color: Colors.indigo[600], fontSize: 25.0),
              ),
            ),
            backgroundColor: Colors.indigo[600],
            body: const SafeArea(
                child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: SoruSayfasi(),
            ))));
  }
}

class SoruSayfasi extends StatefulWidget {
  const SoruSayfasi({super.key});

  @override
  State<SoruSayfasi> createState() => _SoruSayfasiState();
}

List<Widget> secimler = [];
/*List<String> sorular = [ burda gereksiz liste yapısı oluşturmaya gerek yok.
  , //false
  , //true
  , //false
   //false
  , //true
  , //true
  , //true
];*/

/*List<bool> yanitlar = [
  false,
  true,
  false,
  false,
  true,
  true,
  true,
];*/

TestVeri test1 = TestVeri();

class _SoruSayfasiState extends State<SoruSayfasi> {
  void butonSecim(bool secilenButon) {
    if (test1.testBittiMi() == true) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("UYARI"),
              content: const Text("soru sayısı bitti, Başa Dönmek için tıkla"),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("Close"),
                ),
              ],
            );
          });
      setState(() {
        test1.testiSifirla();

        secimler = []; //emojileri sıfırladık
      });
    } else {
      setState(() {
        if (test1.getSoruYaniti() == secilenButon) {
          secimler.add(kdogruIkon);
        } else {
          secimler.add(kyanlisIkon);
        }
        test1.sonrakiSoru();

        //secimler.add(kyanlisIkon);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 4,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                test1.getSoruMetni(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Wrap(
          spacing: 10.0,
          runSpacing: 5.0,
          children: secimler,
        ),
        Expanded(
          flex: 1,
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6.0),
              child: Row(children: <Widget>[
                Expanded(
                    child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                          ),
                          child: const Icon(
                            Icons.thumb_down,
                            size: 30.0,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            butonSecim(false);
                          },
                        ))),
                Expanded(
                    child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue),
                          child: const Icon(
                            Icons.thumb_up,
                            size: 30.0,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            butonSecim(true);
                          },
                        ))),
              ])),
        )
      ],
    );
  }
}
