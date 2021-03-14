import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_code/simple_code.dart';
import 'package:yeslist_project/controllers/fill_gallon_controller.dart';

class FillGalonPage extends StatefulWidget {
  static final String route = '/home';
  @override
  _FillGalonPageState createState() => _FillGalonPageState();
}

class _FillGalonPageState extends State<FillGalonPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController volumeDoGalao = new TextEditingController();
  final TextEditingController quantidadeDeGarrafas =
      new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildAnimationTitleWidget(),
              _buildFillGalonTextFieldWidget(
                  hintText: 'Qual o volume do galão em litros?',
                  controller:
                      Provider.of<FillGalonController>(context, listen: false)
                          .volumeDoGalaoController),
              SizedBox(height: hsz(16.0)),
              _buildFillGalonTextFieldWidget(
                  hintText: 'Qual a quantidade de garrafas?',
                  controller: Provider.of<FillGalonController>(context)
                      .quantidadeDeGarrafasController),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_formKey.currentState.validate()) {
            context.read<FillGalonController>().getValorDasGarrafas();
            Navigator.pushNamed(context, '/choosebottlesize');
          }
        },
        child: Center(
          child: Icon(Icons.navigate_next),
        ),
      ),
    );
  }

  AnimationWidget _buildAnimationTitleWidget() {
    return AnimationWidget(
      duration: new Duration(seconds: 1),
      offset: Offset(300, 0),
      opacity: 0.5,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 64.0),
        child: Text(
          'Yes List - Algorithm',
          style: TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.bold,
            fontSize: sz(32.0),
          ),
        ),
      ),
    );
  }

  Widget _buildFillGalonTextFieldWidget(
      {@required String hintText, @required TextEditingController controller}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Os dados estão incorretos";
          }
          return null;
        },
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: hintText,
        ),
        keyboardType: TextInputType.number,
        controller: controller,
      ),
    );
  }
}
