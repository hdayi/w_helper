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
  String olmayanlar = "kalebi";
  String ex = '^[^$olmayanlar]*\$';
  var olmayan = RegExp(ex);

  File("./data/all.txt")
      .openRead()
      .map(utf8.decode)
      .transform(LineSplitter())
      .forEach(
    (kelime) {
      if (kelime.length == 5 && !kelime.contains(" ")) {
        var k = kelime.toLowerCaseTr();
        if ( //
            olmayan.hasMatch(k) &&
                (k.indexOf("r") == 2 || k.secondIndexOf("r") == 2) &&
                (k.indexOf("m") == 4 || k.secondIndexOf("m") == 4)
            //
            ) {
          print(k);
        }
      }
    },
  );
}
