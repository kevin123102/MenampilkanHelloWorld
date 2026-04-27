import 'package:flutter/material.dart';

class ProdukDetail extends StatefulWidget {
  final String kodeProduk;
  final String namaProduk;
  final int harga;

  const ProdukDetail({
    Key? key,
    required this.kodeProduk,
    required this.namaProduk,
    required this.harga,
  }) : super(key: key);

  @override
  _ProdukDetailState createState() => _ProdukDetailState();
}

class _ProdukDetailState extends State<ProdukDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Produk'),
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: Colors.grey[100],
      body: Center(
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
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.shopping_cart,
                      size: 50, color: Colors.blue),

                  const SizedBox(height: 10),

                  const Text(
                    "Detail Produk",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 20),

                  _itemDetail(
                    icon: Icons.qr_code,
                    title: "Kode Produk",
                    value: widget.kodeProduk,
                  ),

                  const SizedBox(height: 12),

                  _itemDetail(
                    icon: Icons.inventory,
                    title: "Nama Produk",
                    value: widget.namaProduk,
                  ),

                  const SizedBox(height: 12),

                  _itemDetail(
                    icon: Icons.attach_money,
                    title: "Harga",
                    value: "Rp ${widget.harga}",
                    isHarga: true,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _itemDetail({
    required IconData icon,
    required String title,
    required String value,
    bool isHarga = false,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: Colors.blue),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 13,
                  color: Colors.grey,
                ),
              ),
              Text(
                value,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: isHarga ? Colors.green : Colors.black,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}