import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_code/simple_code.dart';
import 'package:yeslist_project/controllers/fill_gallon_controller.dart';
import 'package:yeslist_project/pages/choose_bottle_size/choose_bottle_size_page.dart';
import 'package:yeslist_project/pages/fill_gallon/fill_gallon_page.dart';


void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => FillGalonController()),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: SimpleCode.navigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'YesList Challenge',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        FillGalonPage.route: (context) => FillGalonPage(),
        ChooseBottleSize.route: (context) => ChooseBottleSize(),
      },
      initialRoute: FillGalonPage.route,
    );
  }
}