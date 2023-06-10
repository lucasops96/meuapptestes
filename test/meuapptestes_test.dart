import 'package:meuapptestes/classes/viacep.dart';
import 'package:meuapptestes/meuapptestes.dart' as appteste;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'meuapptestes_test.mocks.dart';

@GenerateMocks([MockViaCEP])
void main() {

  test('Calcula IMC', () {
    expect(appteste.execute("Pedro",92,1.82),equals(27.77442337881898));
  });
  
  test('Calcula o desconto do produto sem porcentagem', () {
    expect(appteste.calcularDesconto(1000, 150, false), 850);
  });

  test('Calcula o desconto do produto sem porcentagem, passando valor de produto zerado', () {
    expect(() => appteste.calcularDesconto(0, 150, false), throwsA(TypeMatcher<ArgumentError>()));
  });

  test('Calcula o desconto do produto com porcentagem', () {
    expect(appteste.calcularDesconto(1000, 15, true), 850);
  });

  test('Calcula o desconto do produto com porcentagem, passando desconto zerado', () {
    expect(() => appteste.calcularDesconto(1000, 0, true),throwsA(TypeMatcher<ArgumentError>()));
  });

  group('Calcula o valor do produto com desconto:', () {
    var valuesToTest = {
      {'valor':1000, 'desconto':150,'percentual':false}:850,
      {'valor':1000,'desconto':15,'percentual':true}:850,
    };

    valuesToTest.forEach((values, expected) { 

      test('Entrada:$values Esperado:$expected', () {
        expect(
           appteste.calcularDesconto(
            double.parse(values["valor"].toString()),
            double.parse(values["desconto"].toString()),
            values["percentual"] == true),
            equals(expected)
        );
      });
      
    });

  });

  group('Calcula o valor do produto informando valores zerados, deve gerar erro', () {
    var valuesToTest = {
      {'valor':0, 'desconto':150,'percentual':false},
      {'valor':1000,'desconto':0,'percentual':true},
    };

    for (var values in valuesToTest) { 

      test('Entrada:$values', () {
        expect(
          () => appteste.calcularDesconto(
            double.parse(values["valor"].toString()),
            double.parse(values["desconto"].toString()),
            values["percentual"] == true),
           throwsA(TypeMatcher<ArgumentError>())
        );
      });
      
    }

  });


  test('Calcula o desconto do produto com porcentagem, passando desconto zerado', () {
    expect(appteste.converteToUpper("miguel"),equals("MIGUEL"));
  });

  test('Começa com', () {
    expect(appteste.converteToUpper("miguel"),startsWith("M"));
  });

  test('Retornar CEP', () async {

    MockMockViaCEP mockMockViaCEP = MockMockViaCEP();
    when(mockMockViaCEP.retornarCEP("01001000")).thenAnswer((realInvocation) => Future.value({
      "cep": "01001-000",
      "logradouro": "Praça da Sé",
      "complemento": "lado ímpar",
      "bairro": "Sé",
      "localidade": "São Paulo",
      "uf": "SP",
      "ibge": "3550308",
      "gia": "1004",
      "ddd": "11",
      "siafi": "7107"
      }));

    var body = await mockMockViaCEP.retornarCEP("01001000");
    expect(body["bairro"], equals("Sé"));
    expect(body["logradouro"], equals("Praça da Sé"));
  });
}

class MockViaCEP extends Mock implements ViaCEP{

}