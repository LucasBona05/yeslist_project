import 'package:flutter/material.dart';

class ChooseBottleSizePage extends StatefulWidget {
  @override
  _ChooseBottleSizePageState createState() => _ChooseBottleSizePageState();
}

class _ChooseBottleSizePageState extends State<ChooseBottleSizePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 243, 239, 1),
      body: Center(
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
                      border: InputBorder.none, hintText: 'Volume do Galão(L)'),
                  keyboardType: TextInputType.number,
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Center(
          child: Icon(Icons.navigate_next),
        ),
      ),
    );
  }
}