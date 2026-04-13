import 'package:flutter/material.dart';
import 'package:hillowordd/ui/produk_detail.dart';

class Produkform extends StatefulWidget {
  @override
  _Produkformstate createState() => _Produkformstate();
}

class _Produkformstate extends State<Produkform> {
  final _kodeProdukTextboxController = TextEditingController();
  final _namaProdukTextboxController = TextEditingController();
  final _hargaProdukTextboxController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("From Produk")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _textboxkodeProduk(),
            _textboxnamaProduk(),
            _textboxhargaProduk(),
            _tombolSimpan(),
          ],
        ),
      ),
    );
  }

  _textboxkodeProduk() {
    return TextField(
      decoration: InputDecoration(labelText: "Kode Produk"),
      controller: _kodeProdukTextboxController,
      );
  }
  _textboxnamaProduk() {
    return TextField(
      decoration: InputDecoration(labelText: "Nama Produk"),
      controller: _namaProdukTextboxController,
      );
  }
  _textboxhargaProduk() {
    return TextField(
      decoration: InputDecoration(labelText: "Harga Produk"),
      controller: _hargaProdukTextboxController,
      );
  }
  _tombolSimpan() {
    return ElevatedButton(
      child: Text('Simpan'), 
      onPressed: () {
        String kodeProduk = _kodeProdukTextboxController.text;
        String namaProduk = _namaProdukTextboxController.text;
        int harga = int.parse(_hargaProdukTextboxController.text);

        Navigator.of(context).push(
          new MaterialPageRoute(
            builder: (context) => ProdukDetail(
            kodeProduk: kodeProduk, 
            namaProduk: namaProduk, 
            harga: harga,
            ),
          ),
        );
      },
    );
  }
}