import 'package:flutter/material.dart';
import '../controllers/contador_controller.dart';

class ContadorView extends StatefulWidget {
  const ContadorView({super.key});

  @override
  State<ContadorView> createState() => _ContadorViewState();
}

class _ContadorViewState extends State<ContadorView> {
  // Instanciamos o controller da nossa tela
  final ContadorController _controller = ContadorController();

  @override
  void initState() {
    super.initState();
    // Fazemos a tela "escutar" o controller. Sempre que notifyListeners() for chamado, a tela atualiza
    _controller.addListener(_atualizarTela);
  }

  @override
  void dispose() {
    _controller.removeListener(_atualizarTela);
    _controller.dispose();
    super.dispose();
  }

  void _atualizarTela() => setState(() {});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contador Profissional'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Quantidade de cliques:',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 8),
            Text(
              '${_controller.valor}',
              style: const TextStyle(fontSize: 64, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.large(
        onPressed: _controller.incrementar,
        child: const Icon(Icons.add),
      ),
    );
  }
}