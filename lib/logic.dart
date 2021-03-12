import 'dart:io';

void main() {
  getValuesFillGallons();
}

void getValuesFillGallons() {
  List<double> bottleSize = [];
  double gallonSize;
  int bottleQuantity;

  print('Quantos litros o galão possui?');
  gallonSize = double.parse(stdin.readLineSync());
  print('Quantas garrafas você utilizará?');
  bottleQuantity = int.parse(stdin.readLineSync());

  for(int i = 1; i <= bottleQuantity; i++) {
    double cont;
    print('Quantos litros tem a $i° garrafa?');
    cont = double.parse(stdin.readLineSync());
    bottleSize.add(cont);
  }
  bottleSize.sort((b, a) => a.compareTo(b));
  print(bottleSize);
}

