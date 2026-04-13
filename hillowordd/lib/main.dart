import 'package:flutter/material.dart';
import 'package:hillowordd/hello_word.dart';
import 'package:hillowordd/column_widget.dart';
import 'package:hillowordd/row_widget.dart';
import 'package:hillowordd/ui/produk_form.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Menampilkan hello World', home: Produkform());
  }
}