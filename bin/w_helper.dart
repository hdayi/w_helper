import 'dart:convert';
import 'dart:io';
import 'package:turkish/turkish.dart';

extension SecondOccurenceOfSubstring on String {
  int secondIndexOf(String stringToFind) {
    if (indexOf(stringToFind) == -1) return -1;
    return indexOf(stringToFind, indexOf(stringToFind) + 1);
  }

  bool hasSecondOccurence(String stringToFind) {
    return secondIndexOf(stringToFind) != -1;
  }
}

void main(List<String> arguments) {
  String olmayanlar = "alıktn";

  String ex = '^[^$olmayanlar]*\$';
  var olmayan = RegExp(ex);

  File("./data/all.txt")
      .openRead()
      .transform(utf8.decoder)
      // .map(utf8.decode)
      .transform(LineSplitter())
      .forEach(
    (kelime) {
      var k = kelime.toLowerCaseTr();
      if (kelime.length == 5) {
        if ( //
            olmayan.hasMatch(k) &&
                k.contains("s") &&
                k[0] != "s" &&
                k.contains("m") &&
                k[0] != "m" &&
                k[1] == "e" &&
                k.contains("i") &&
                k[3] != "i"

            //
            ) {
          print(k);
        }
      }
    },
  );
}
