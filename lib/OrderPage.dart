import 'package:_20220140201_act4/DetailOrder.dart';
import 'package:flutter/material.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  final TextEditingController makananController = TextEditingController();
  final TextEditingController minumanController = TextEditingController();
  final TextEditingController jumlahMakananController = TextEditingController();
  final TextEditingController jumlahMinumanController = TextEditingController();
  int totalHarga = 0;

  void calculateTotalPrice() {
    int jumlahMakanan = int.tryParse(jumlahMakananController.text) ?? 0;
    int jumlahMinuman = int.tryParse(jumlahMinumanController.text) ?? 0;

    setState(() {
      totalHarga = (jumlahMakanan * 32000) + (jumlahMinuman * 50000);
    });
  }

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(title: Text('Order Page')),
      body: Form(
        key: _formKey,
        child: Column(
          spacing: 16,
          children: [
            TextFormField(
              controller: makananController,
              decoration: const InputDecoration(labelText: 'Food Order'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter yout food order';
                }
                return null;
              },
            ),
            TextFormField(
              controller: minumanController,
              decoration: const InputDecoration(labelText: 'drink Order'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter yout drink order';
                }
                return null;
              },
            ),
            TextFormField(
              controller: jumlahMakananController,
              decoration: const InputDecoration(labelText: 'Food QTY Order'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your qty of food order';
                }
                return null;
              },
            ),
            TextFormField(
              controller: jumlahMinumanController,
              decoration: const InputDecoration(labelText: 'Drink QTY Order'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your qty of drink order';
                }
                return null;
              },
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  calculateTotalPrice();
                  Navigator.push(context, MaterialPageRoute(builder: (context) => DetailOrderPage(
                    makanan: makananController.text, 
                    minuman: minumanController.text, 
                    jumlahMakanan: jumlahMakananController.text, 
                    jumlahMinuman: jumlahMinumanController.text, 
                    totalHarga: totalHarga)),);
                }
              },
              child: Text('Order Now'),
            ),
          ],
        ),
      ),
    );
  }
}
