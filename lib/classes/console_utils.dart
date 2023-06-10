import 'dart:convert';
import 'dart:io';

class ConsoleUtils{
    
  static  String lerConsole(String texto){
    print(texto);
    var line = stdin.readLineSync(encoding: utf8);
    return line ?? "";
  }
}