import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('Dois Blocos com Textos'),
        ),
        body: Center(
          child: Column(
            children: [
              // Primeiro bloco com largura máxima e margem
              Container(
                width: double.infinity, // Ocupar toda a largura
                margin: const EdgeInsets.all(8.0), // Margem ao redor
                padding: const EdgeInsets.all(16.0),
                color: Colors.blueAccent,
                child: const Text(
                  'Texto no primeiro bloco',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
              // Segundo bloco com largura máxima e margem
              Container(
                width: double.infinity, // Ocupar toda a largura
                margin: const EdgeInsets.all(8.0), // Margem ao redor
                padding: const EdgeInsets.all(16.0),
                color: Colors.greenAccent,
                child: const Text(
                  'Texto no segundo bloco',
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
