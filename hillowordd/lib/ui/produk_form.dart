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
      appBar: AppBar(
        title: Text("From Produk"),
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            elevation: 6,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  _textboxkodeProduk(),
                  SizedBox(height: 12),
                  _textboxnamaProduk(),
                  SizedBox(height: 12),
                  _textboxhargaProduk(),
                  SizedBox(height: 20),
                  _tombolSimpan(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _textboxkodeProduk() {
    return TextField(
      decoration: InputDecoration(
        labelText: "Kode Produk",
        prefixIcon: Icon(Icons.qr_code),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      controller: _kodeProdukTextboxController,
    );
  }

  _textboxnamaProduk() {
    return TextField(
      decoration: InputDecoration(
        labelText: "Nama Produk",
        prefixIcon: Icon(Icons.inventory),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      controller: _namaProdukTextboxController,
    );
  }

  _textboxhargaProduk() {
    return TextField(
      decoration: InputDecoration(
        labelText: "Harga Produk",
        prefixIcon: Icon(Icons.attach_money),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      controller: _hargaProdukTextboxController,
    );
  }

  _tombolSimpan() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
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
      ),
    );
  }
}