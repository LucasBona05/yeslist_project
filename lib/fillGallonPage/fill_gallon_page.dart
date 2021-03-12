import 'package:flutter/material.dart';
import 'package:yeslist_project/chooseBottleSizePage/choose_bottle_size.dart';

class FillGallonPage extends StatefulWidget {
  @override
  _FillGallonPageState createState() => _FillGallonPageState();
}

class _FillGallonPageState extends State<FillGallonPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 243, 239, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(97, 224, 209, 1),
        title: Text('O maior preenchedor de galões!'),
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      border: Border.all(color: Color(0xFF00628F))),
                  child: TextFormField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Volume do Galão(L)'),
                    keyboardType: TextInputType.number,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      border: Border.all(color: Color(0xFF00628F))),
                  child: TextFormField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Quantidade de Garrafas'),
                    keyboardType: TextInputType.number,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (builder) => ChooseBottleSizePage()));
        },
        child: Center(
          child: Icon(Icons.navigate_next),
        ),
      ),
    );
  }
}
