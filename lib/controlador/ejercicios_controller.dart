import '../modelo/resultado_model.dart';

class EjerciciosController {
  ResultadoModel calcular(int numero) {
    return ResultadoModel(
      numero: numero,
      esPrimo: _esPrimo(numero),
      factorial: _factorial(numero),
      esCapicua: _esCapicua(numero),
    );
  }

  bool _esPrimo(int numero) {
    if (numero < 2) {
      return false;
    }

    for (int i = 2; i * i <= numero; i++) {
      if (numero % i == 0) {
        return false;
      }
    }
    return true;
  }

  String _factorial(int numero) {
    if (numero < 0) {
      return 'No existe para numeros negativos';
    }

    int resultado = 1;
    final pasos = <String>[];

    for (int valor = numero; valor >= 1; valor--) {
      pasos.add(valor.toString());
      resultado *= valor;
    }

    if (pasos.isEmpty) {
      return '0! = 1';
    }

    return '$numero! = ${pasos.join(' x ')} = $resultado';
  }

  bool _esCapicua(int numero) {
    final texto = numero.abs().toString();
    return texto == texto.split('').reversed.join();
  }
}