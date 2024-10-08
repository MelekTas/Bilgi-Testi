import 'package:bilgi_testi/soru.dart';

class TestVeri {
  int sayac = 0;

  final List<Soru> _soruBankasi = [
    Soru(
        soruMetni: 'Titanic gelmiş geçmiş en büyük gemidir ',
        soruYaniti: false),
    Soru(
        soruMetni: 'Dünyadaki tavuk sayısı insan sayısından fazladır',
        soruYaniti: true),
    Soru(soruMetni: 'Kelebeklerin ömrü bir gündür ', soruYaniti: false),
    Soru(soruMetni: 'Dünya düzdür', soruYaniti: false),
    Soru(
        soruMetni: 'Kaju fıstığı aslında bir meyvenin sapıdır',
        soruYaniti: true),
    Soru(
        soruMetni: 'Fatih Sultan Mehmet hiç patates yememiştir',
        soruYaniti: true),
    Soru(soruMetni: 'Fransızlar 80 demek için, 4 - 20 der', soruYaniti: true),
  ];

  String getSoruMetni() {
    return _soruBankasi[sayac].soruMetni;
  }

/*String setSoruMetni(int sayac){
  return _soruBankasi[sayac].soruMetni;
}
*/
  bool getSoruYaniti() {
    return _soruBankasi[sayac].soruYaniti;
  }

/*bool setSoruYaniti(int sayac){
  return _soruBankasi[sayac].soruYaniti;
}
*/
  void sonrakiSoru() {
    if (sayac + 1 < _soruBankasi.length) {
      sayac++;
    }
  }

  bool testBittiMi() {
    if (sayac + 1 >= _soruBankasi.length) {
      return true;
    } else {
      return false;
    }
  }

  void testiSifirla() {
    sayac = 0;
  }
}
