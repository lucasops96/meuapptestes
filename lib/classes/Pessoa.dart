class Pessoa {
  String _nome = "";
  double _peso = 0;
  double _altura= 0;

  Pessoa(String nome, double peso, double altura){
    _nome = nome;
    _peso = peso;
    _altura = altura;
  }

  String getNome(){
    return _nome;
  }

  double calcularIMC(){
    var imc = _peso/(_altura*_altura);
    return imc;
  }
}