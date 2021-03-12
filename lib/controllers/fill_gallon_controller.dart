import 'package:flutter/widgets.dart';
import 'package:yeslist_project/models/result_model.dart';

class FillGalonController extends ChangeNotifier {
  double volumeDoGalao;
  int quantidadeDeGarrafas;
  TextEditingController quantidadeDeGarrafasController =
      new TextEditingController();
  TextEditingController volumeDoGalaoController = new TextEditingController();
  List<double> valorDasGarrafas = [];

  getValorDasGarrafas() {
    this.quantidadeDeGarrafas = int.parse(quantidadeDeGarrafasController.text);
    print('valor das garrafas antes: $valorDasGarrafas');
    for (int i = 0; i < this.quantidadeDeGarrafas; i++)
      valorDasGarrafas.add(0.0);
    print('valor das garrafas depois: $valorDasGarrafas');
  }

  Result calculateAlgorithm() {
    // Apontar minha lista para os valores de garrafas atuais;
    List<double> garrafas = this.valorDasGarrafas;
    print('Garrafas: $garrafas');
    List garrafasUtilizadas = [];
    print('GARRAFAS UTLIZADAS VAZIAS: $garrafasUtilizadas');
    double volumeDoGalaoAux = double.parse(this.volumeDoGalaoController.text);
    // Ordenar ao contrário;
    garrafas.sort((a, b) => b.compareTo(a));
    // Iterar sobre as garrafas para realizar as verificações necessárias
    print('GARRAFAS TAMANHO: ${garrafas.length}');
    for (final double garrafa in garrafas) {
      if (volumeDoGalaoAux - garrafa >= 0) {
        volumeDoGalaoAux -= garrafa;
        garrafasUtilizadas.add(garrafa.toStringAsFixed(1));
        print('PREENCHENDO GARRAFAS UTILIZADAS: $garrafasUtilizadas');
      }
    }
    print('Garrafas utilizadas');
    return new Result(garrafasUtilizadas, volumeDoGalaoAux);
  }
}