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
      home: const HomePage(),
    );
  }
}

// Criação de um StatefulWidget para gerenciar o estado da lista de blocos
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> blocks = [
    'Primeiro Bloco: Texto no primeiro blocos',
    'Segundo Bloco: Texto no segundo bloco'
  ];

  // Função para adicionar um novo bloco
  void _addBlock(String text) {
    setState(() {
      blocks.add(text);
    });
  }

  // Função para exibir o diálogo para inserir um novo bloco
  void _showAddBlockDialog() {
    String newText = '';

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Adicionar Novo Bloco'),
          content: TextField(
            onChanged: (value) {
              newText = value;
            },
            decoration: const InputDecoration(hintText: 'Digite o título'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Fecha o diálogo
              },
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                if (newText.isNotEmpty) {
                  _addBlock(newText);
                }
                Navigator.of(context).pop(); // Fecha o diálogo
              },
              child: const Text('Ok'),
            ),
          ],
        );
      },
    );
  }

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
            // Exibir cada bloco dinamicamente
            ...blocks.asMap().entries.map((entry) {
              int index = entry.key;
              String text = entry.value;

              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          DetailPage(text: text),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        return child; // Sem animação
                      },
                    ),
                  );
                },
                child: Container(
                  width: double.infinity,
                  margin: const EdgeInsets.all(8.0),
                  padding: const EdgeInsets.all(16.0),
                  color:
                      index % 2 == 0 ? Colors.blueAccent : Colors.greenAccent,
                  child: Text(
                    text,
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              );
            }),
            // Botão para adicionar novo bloco
            ElevatedButton(
              onPressed: _showAddBlockDialog,
              child: const Text('Adicionar Novo Bloco'),
            ),
          ],
        ),
      ),
    );
  }
}

// Página de detalhes
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
          text,
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
