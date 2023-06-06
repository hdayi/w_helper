import 'dart:convert';
import 'dart:io';
import 'package:turkish/turkish.dart';

void main(List<String> arguments) {
  File("./data/all.txt")
      .openRead()
      .map(utf8.decode)
      .transform(LineSplitter())
      .forEach(
    (kelime) {
      if (kelime.length == 5 && !kelime.contains(" ")) {
        var k = kelime.toLowerCaseTr();
        if (!k.contains("k") &&
            !k.contains("a") &&
            !k.contains("e") &&
            !k.contains("m") &&
            !k.contains("t") &&
            !k.contains("o") &&
            !k.contains("z") &&
            !k.contains("u") &&
            k.contains("r") &&
            k.indexOf("r") != 1 &&
            k.indexOf("l") == 3) {
          print(k);
        }
      }
    },
  );
}
