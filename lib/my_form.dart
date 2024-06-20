import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class PengaduanForm extends StatefulWidget {
  @override
  _PengaduanFormState createState() => _PengaduanFormState();
}

class _PengaduanFormState extends State<PengaduanForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _aspirationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Pengaduan'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: 'Nama',
                    border: InputBorder.none,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Nama tidak boleh kosong';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 20.0),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: TextFormField(
                  controller: _addressController,
                  decoration: InputDecoration(
                    labelText: 'Alamat',
                    border: InputBorder.none,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Alamat tidak boleh kosong';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 20.0),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: TextFormField(
                  controller: _aspirationController,
                  decoration: InputDecoration(
                    labelText: 'Aspirasi',
                    border: InputBorder.none,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Aspirasi tidak boleh kosong';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
 onPressed: () async {
    if (_formKey.currentState!.validate()) {
      // Data valid, kirim ke Firebase
      final url = 'https://restproject-7c35c-default-rtdb.firebaseio.com/restproject.json';
      final response = await http.post(
        Uri.parse(url),
        body: json.encode({
          'nama': _nameController.text,
          'alamat': _addressController.text,
          'aspirasi': _aspirationController.text,
        }),
      );

      if (response.statusCode == 200) {
        // Berhasil dikirim
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Data Terkirim'),
              content: Text('Data pengaduan berhasil terkirim.'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Tutup'),
                ),
              ],
            );
          },
        );
      } else {
        // Gagal mengirim
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Gagal Mengirim'),
              content: Text('Maaf, terjadi kesalahan saat mengirim data.'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Tutup'),
                ),
              ],
            );
          },
        );
      }
    }
  },
  child: Text('Kirim'),
),

            ],
          ),
        ),
      ),
    );
  }
}
