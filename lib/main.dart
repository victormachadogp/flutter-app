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
      home: const HomePage(), // Definindo a HomePage corretamente
    );
  }
}

// Criação de uma nova classe HomePage para separar a lógica da página inicial
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Dois Blocos com Textos'),
      ),
      body: Center(
        child: Column(
          children: [
            // Primeiro botão com largura máxima e margem
            InkWell(
              onTap: () {
                // Navegar para a DetailPage com o texto correspondente
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        const DetailPage(
                      text: 'Primeiro Bloco: Texto no primeiro bloco',
                    ),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      return child; // Sem animação
                    },
                  ),
                );
              },
              child: Container(
                width: double.infinity, // Ocupar toda a largura
                margin: const EdgeInsets.all(8.0), // Margem ao redor
                padding: const EdgeInsets.all(16.0),
                color: Colors.blueAccent,
                child: const Text(
                  'Texto no primeiro bloco',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
            // Segundo bloco com largura máxima e margem
            InkWell(
              onTap: () {
                // Navegar para a DetailPage com o texto correspondente
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        const DetailPage(
                      text: 'Segundo Bloco: Texto no segundo bloco',
                    ),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      return child; // Sem animação
                    },
                  ),
                );
              },
              child: Container(
                width: double.infinity, // Ocupar toda a largura
                margin: const EdgeInsets.all(8.0), // Margem ao redor
                padding: const EdgeInsets.all(16.0),
                color: Colors.greenAccent,
                child: const Text(
                  'Texto no segundo bloco',
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Detail page
class DetailPage extends StatelessWidget {
  final String text;

  const DetailPage({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Detalhes'),
      ),
      body: Center(
        child: Text(
          text, // Mostra o texto correspondente do bloco clicado
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
