import 'package:flutter/material.dart';
import 'vista/bienvenida_view.dart';

void main() {
	runApp(const MyApp());
}

class MyApp extends StatelessWidget {
	const MyApp({super.key});

	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			debugShowCheckedModeBanner: false,
			title: 'Ejercicios numéricos',
			theme: ThemeData(
				colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 142, 148, 179)),
			),
			home: const BienvenidaView(),
		);
	}
}
