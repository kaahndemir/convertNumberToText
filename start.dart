import 'dart:convert';
import 'dart:io';

List rakamlar = [
  '',
  'bir',
  'iki',
  'üç',
  'dört',
  'beş',
  'altı',
  'yedi',
  'sekiz',
  'dokuz'
];
List onlar = [
  '',
  'on',
  'yirmi',
  'otuz',
  'kırk',
  'elli',
  'altmış',
  'yetmiş',
  'seksen',
  'doksan'
];
List basamaklar = [
  'bin',
  'milyon',
  'milyar',
  'trilyon',
  'katrilyon',
  'kentilyon',
  'sekstilyon',
  'septilyon',
  'oktilyon',
  'nonilyon',
  'desilyon',
  'andesilyon',
  'dodesilyon',
  'tredesilyon',
  'katordesilyon',
  'kendesilyon',
  'seksdesilyon',
  'septendesilyon',
  'oktodesilyon',
  'novemdesilyon',
  'vicintilyon',
  'anvicinyilton',
  'dovicintilyon',
  'trevicintilyon',
  'katorvicintilyon',
  'kenkavicintilyon',
  'sesvicintilyon',
  'septemvicintilyon',
  'oktovicintilyon',
  'novemvicintilyon',
  'tricintilyon',
  'antricintilyon',
  'dotricintilyon'
];

void main() {
  print('Sayı giriniz (Dotricintilyon\'dan [10⁹⁹] küçük) :');
  String sayi = stdin.readLineSync(encoding: utf8) ?? '';


  /* String sayi = '1000'; */

  double doubleSonBasamak = sayi.length / 3;
  print('doubleSonBasamak: $doubleSonBasamak');
  int sonBasamak =  doubleSonBasamak.toInt();
  int sonBasUzunluk = sayi.length % 3;

  //Eğer üçe tam bölünüyor ve basamak 0'dan büyükse sonBasUzunluk 3'tür
  //Eğer basamak 0 ise sayı binden küçük demektir
  if (sonBasUzunluk == 0 && sonBasamak > 0) {
    sonBasUzunluk = 3;
  }

  print('sonBasUzunluk: $sonBasUzunluk');
  print('sonBasamak $sonBasamak');

  List sayiParcaList = [];

  String parca = '';
  //İlk parçayı (15 ___ ___) sayiParcaList'e ekler
  for (int i = 0; i < sonBasUzunluk; i++) {
    parca += sayi[i];
  }

  sayiParcaList.add(parca);

  //Üçlü bütünler halinde sayiParcaList'e ekler
  if (sonBasamak >= 1) {
    for (int i = sonBasUzunluk; i < sonBasamak * 3; i += 3) {
      String uclu = '';
      for (int e = 0; e < 3; e++) {
        uclu += sayi[e + i];
      }
      sayiParcaList.add(uclu);
    }
  }

  String cikti = '';

  //İlk parçayı $cikti'ya yazı olarak ekle
  String sonuc = '';
  String ilkParca = sayiParcaList[0] as String;

  if (ilkParca.length == 1) {
    if((int.parse(ilkParca[0])) > 0 && sonBasamak < 1){
      sonuc += '${rakamlar[(int.parse(ilkParca[0]))]} ';
    }
  } else if (ilkParca.length == 2) {
    if (int.parse(ilkParca[0]) > 0) {
        sonuc += '${onlar[(int.parse(ilkParca[0]))]} ';
    }
    if((int.parse(ilkParca[1])) > 0){
      sonuc += '${rakamlar[(int.parse(ilkParca[1]))]} ';
    }

  } else if (ilkParca.length == 3) {
    String yuzler = rakamlar[(int.parse(ilkParca[0]))];

    if (int.parse(ilkParca[0]) > 1) {
      sonuc += '${yuzler} ';
    }
    sonuc += 'yüz ';
    if((int.parse(ilkParca[1])) > 0){
      sonuc += '${onlar[(int.parse(ilkParca[1]))]} ';
    }
    if((int.parse(ilkParca[2])) > 0){
      sonuc += '${rakamlar[(int.parse(ilkParca[2]))]} ';
    }
  }

  cikti += sonuc;

  //Basamak adını $cikti'ya ekle
  if (sayiParcaList.length > 1) {
    cikti += '${basamaklar[sayiParcaList.length - 2]} ';
  }

  print(sayiParcaList);

  //İlk parça dışındakileri $çıktı'ya ekle
  for (int i = 1; i < sayiParcaList.length; i++) {
    String temp = sayiParcaList[i][0];
    String yuzler = rakamlar[(int.parse(sayiParcaList[i][0]))];

    if (int.parse(sayiParcaList[i][0]) > 1) {
      cikti += '${yuzler}';
    }
    if (int.parse(sayiParcaList[i][0]) > 0){
      cikti += ' yüz ';
    }
    if(int.parse(sayiParcaList[i][1]) > 0){
      cikti += '${onlar[(int.parse(sayiParcaList[i][1])) ]} ';
    }
    if(int.parse(sayiParcaList[i][2]) > 0){
      cikti += '${rakamlar[(int.parse(sayiParcaList[i][2])) ]} ';
    }
    if (i != sayiParcaList.length - 1 && int.parse(sayiParcaList[i][0]) > 1) {
      cikti += '${basamaklar[sayiParcaList.length - i - 2]} ';
    }
  }

  
  print('Çıktı: $cikti');
  print('Uzunluk: ${cikti.length}');
}
