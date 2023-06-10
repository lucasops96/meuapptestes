import 'classes/Pessoa.dart';

double execute(String nome, double peso, double altura){
   
  Pessoa p = Pessoa(nome, peso, altura);
  var imc = p.calcularIMC();
    
  if(imc < 16){
    print("Magreza Grave $imc");
  }else if(16 <= imc && imc < 17){
    print("Magreza Moderada $imc");
  }else if(17 <= imc && imc < 18.5){
    print("Magreza Leve $imc");
  }else if(18.5 <= imc && imc < 25){
    print("Saudável $imc");
  }else if(25 <= imc && imc < 30){
    print("Sobrepeso $imc");
  }else if(30 <= imc && imc < 35){
    print("Obesidade Grau 1 $imc");
  }else if(35 <= imc && imc < 40){
    print("Obesidade Grau 2 $imc");
  }else if(imc >= 40){
    print("Obesidade Grau 3 $imc");
  }

  return imc;
}















double calcularDesconto(double valor, double desconto, bool percentual){
  if(valor <= 0){
    throw ArgumentError("O valor do produto não pode ser zero");
  }

  if(desconto <= 0){
    throw ArgumentError("O valor do desconto não pode ser zero");
  }

  if(percentual){
    return valor - ((valor * desconto) / 100);
  }
  return valor - desconto;
}

String converteToUpper(String texto){
  return texto.toUpperCase();
}

double retornaValor(double valor){
  return valor;
}

