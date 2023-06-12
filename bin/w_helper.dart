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
  File("./data/all.txt")
      .openRead()
      .map(utf8.decode)
      .transform(LineSplitter())
      .forEach(
    (kelime) {
      if (kelime.length == 5 && !kelime.contains(" ")) {
        var k = kelime.toLowerCaseTr();
        if ( //
            // !k.contains("k") &&
            //     !k.contains("a") &&
            //     !k.contains("e") &&
            //     !k.contains("m") &&
            //     !k.contains("t") &&
            //     !k.contains("o") &&
            //     !k.contains("z") &&
            //     !k.contains("u") &&
            k.contains("a") && k.indexOf("a") == 1 && k.secondIndexOf("a") == 4
            //
            ) {
          print(k);
        }
      }
    },
  );
}
