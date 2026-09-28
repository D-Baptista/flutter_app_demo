import 'package:flutter/material.dart';

class ContadorController extends ChangeNotifier {
  int _valor = 0;

  // Getter para expor o valor de forma segura (apenas leitura externa)
  int get valor => _valor;

  void incrementar() {
    _valor++;
    // Avisa todos os componentes visuais que estão escutando que o valor mudou
    notifyListeners();
  }
}