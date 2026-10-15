import 'package:flutter/material.dart';
import '../controlador/ejercicios_controller.dart';
import '../modelo/resultado_model.dart';

class EjerciciosView extends StatefulWidget {
  const EjerciciosView({super.key});

  @override
  State<EjerciciosView> createState() => _EjerciciosViewState();
}

class _EjerciciosViewState extends State<EjerciciosView> {
  final _numeroController = TextEditingController();
  final _ejerciciosController = EjerciciosController();
  ResultadoModel? _resultado;
  String? _mensaje;

  @override
  void dispose() {
    _numeroController.dispose();
    super.dispose();
  }

  void _calcular() {
    final numero = int.tryParse(_numeroController.text.trim());

    setState(() {
      if (numero == null) {
        _resultado = null;
        _mensaje = 'Ingresa un numero entero valido.';
        return;
      }

      _mensaje = null;
      _resultado = _ejerciciosController.calcular(numero);
    });
  }

  void _limpiar() {
    setState(() {
      _numeroController.clear();
      _resultado = null;
      _mensaje = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ejercicios')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Ingresa un numero entero',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _numeroController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Ejemplo: 1221',
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: FilledButton(
                    onPressed: _calcular,
                    child: const Text('Calcular'),
                  ),
                ),
                const SizedBox(width: 12),
                OutlinedButton(
                  onPressed: _limpiar,
                  child: const Text('Limpiar'),
                ),
              ],
            ),
            if (_mensaje != null) ...[
              const SizedBox(height: 16),
              Text(
                _mensaje!,
                style: TextStyle(color: Theme.of(context).colorScheme.error),
              ),
            ],
            if (_resultado != null) ...[
              const SizedBox(height: 28),
              Text(
                'Resultados',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 12),
              _ResultadoItem(
                titulo: 'Numero primo',
                resultado: _resultado!.esPrimo ? 'Sí' : 'No',
              ),
              _ResultadoItem(
                titulo: 'Factorial',
                resultado: _resultado!.factorial,
              ),
              _ResultadoItem(
                titulo: 'Numero capicúa',
                resultado: _resultado!.esCapicua ? 'Sí' : 'No',
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _ResultadoItem extends StatelessWidget {
  final String titulo;
  final String resultado;

  const _ResultadoItem({required this.titulo, required this.resultado});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(titulo, style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 6),
            Text(resultado),
          ],
        ),
      ),
    );
  }
}