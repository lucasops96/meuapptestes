import 'package:meuapptestes/classes/console_utils.dart';
import 'package:meuapptestes/meuapptestes.dart' as meuapptestes;

void main(List<String> arguments) {
  try {
    var nome = ConsoleUtils.lerConsole("Digite seu nome");
    var peso = double.parse(ConsoleUtils.lerConsole("Digite seu peso:"));
    var altura = double.parse(ConsoleUtils.lerConsole("Digite sua altura:"));
    meuapptestes.execute(nome,peso,altura);
  } catch (e) {
    print(e);
  } 
}
