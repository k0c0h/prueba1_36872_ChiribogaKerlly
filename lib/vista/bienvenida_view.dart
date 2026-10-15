import 'package:flutter/material.dart';
import 'ejercicios_view.dart';

class BienvenidaView extends StatelessWidget {
  const BienvenidaView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 163, 184, 228),
      appBar: AppBar(backgroundColor:const Color.fromARGB(255, 18, 42, 96), title: const Text('Prueba - Chiriboga Kerlly', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 255, 255, 255)),),),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.calculate_outlined, size: 72),
              const SizedBox(height: 20),
              Text(
                'Bienvenido',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 12),
              const Text(
                'Ir a los ejercicios propuestos.',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 28),
              FilledButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const EjerciciosView(),
                    ),
                  );
                },
                child: const Text('Siguiente'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}