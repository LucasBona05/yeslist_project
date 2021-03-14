import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_code/simple_code.dart';
import 'package:yeslist_project/controllers/fill_gallon_controller.dart';
import 'package:yeslist_project/models/result_model.dart';

class ChooseBottleSize extends StatefulWidget {
  static final String route = '/choosebottlesize';
  @override
  _ChooseBottleSizeState createState() => _ChooseBottleSizeState();
}

class _ChooseBottleSizeState extends State<ChooseBottleSize> {
  final _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<FillGalonController>(
        builder: (context, provider, widget) {
          return ListView.builder(
            itemCount: int.parse(provider.quantidadeDeGarrafasController.text),
            itemBuilder: (_, index) {
              return Column(
                children: [
                  Padding(
                    padding: index == 0
                        ? const EdgeInsets.only(top: 16.0)
                        : EdgeInsets.all(0),
                    child: ListTile(
                      onTap: () {
                        showDialog(
                          builder: (context) {
                            final controller = TextEditingController();
                            return Form(
                              key: _formKey,
                              child: SimpleDialog(
                                title:
                                    Text('Digite o valor em Litros desejado!'),
                                elevation: 10.0,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16.0, vertical: 8.0),
                                    child: TextFormField(
                                      controller: controller,
                                      validator: (value) {
                                        if (value == null || value == '') {
                                          return "Insira um Valor Válido";
                                        }
                                        return null;
                                      },
                                      keyboardType: TextInputType.number,
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      if (_formKey.currentState.validate()) {
                                        provider.valorDasGarrafas[index] =
                                            double.parse(controller.text);
                                        Navigator.pop(context);
                                      }
                                    },
                                    child: Center(
                                      child: Text('Ok!'),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                          context: context,
                        );
                      },
                      title: Text(
                        'VOLUME DA GARRAFA ${index + 1}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text('O Valor padrão é 0.0'),
                      leading: provider.valorDasGarrafas[index] == 0.0
                          ? Icon(
                              Icons.add,
                              color: Colors.red,
                            )
                          : Icon(
                              Icons.done_all,
                              color: Colors.green,
                            ),
                      trailing: Text(
                        '${provider.valorDasGarrafas[index]} L',
                        style: provider.valorDasGarrafas[index] == 0.0
                            ? TextStyle(color: Colors.red)
                            : TextStyle(color: Colors.green),
                      ),
                    ),
                  ),
                  Divider(
                    indent: 10.0,
                    endIndent: 10.0,
                  ),
                ],
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (_) {
                return Consumer<FillGalonController>(
                    builder: (context, provider, widget) {
                  Result result = provider.calculateAlgorithm();
                  return SimpleDialog(
                    title: Text('O Resultado desse calculo é:'),
                    children: [
                      SizedBox(
                        height: hsz(20.0),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          'Garrafas: ${result.garrafasUtilizadas}',
                          style: TextStyle(
                              fontSize: sz(16), fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: hsz(20.0),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          'Sobrou: ${result.sobrou.toStringAsFixed(1)}',
                          style: TextStyle(
                              fontSize: sz(16), fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: hsz(20.0),
                      ),
                      TextButton(
                        onPressed: () {
                          context.read<FillGalonController>().clear();
                          Navigator.pushReplacementNamed(context, '/home');
                          this.dispose();
                        },
                        child: Text(
                          'Tentar Novamente',
                          style: TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  );
                });
              });
        },
        child: Center(
          child: Icon(Icons.navigate_next),
        ),
      ),
    );
  }
}
