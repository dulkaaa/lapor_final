import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class KomentForm extends StatefulWidget {
  @override
  _KomentFormState createState() => _KomentFormState();
}

class _KomentFormState extends State<KomentForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Komentar'),
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
                    labelText: 'Komentar',
                    border: InputBorder.none,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return ' tidak boleh kosong';
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
      final url = 'https://komentarapi-default-rtdb.firebaseio.com/komentaraplikasi.json';
      final response = await http.post(
        Uri.parse(url),
        body: json.encode({
          'komentar': _nameController.text,
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