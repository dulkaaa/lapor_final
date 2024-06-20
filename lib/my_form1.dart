import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class AspirasiForm extends StatefulWidget {
  @override
  _AspirasiFormState createState() => _AspirasiFormState();
}

class _AspirasiFormState extends State<AspirasiForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _aspirationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Aspirasi'),
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
                    // Validasi formulir berhasil, lanjutkan untuk mengirim data ke Firebase
                    final url = Uri.parse('https://api-4bca5-default-rtdb.firebaseio.com/aspirasi.json');
                    try {
                      // Kirim data formulir ke Firebase
                      final response = await http.post(
                        url,
                        body: json.encode({
                          'nama': _nameController.text,
                          'alamat': _addressController.text,
                          'aspirasi': _aspirationController.text,
                        }),
                      );

                      if (response.statusCode == 200) {
                        // Jika data berhasil dikirim, tampilkan dialog sukses
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Data Terkirim'),
                              content: Text('Data aspirasi berhasil dikirim.'),
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
                        // Jika terjadi kesalahan saat mengirim data
                        throw Exception('Gagal mengirim data');
                      }
                    } catch (e) {
                      // Tangani kesalahan
                      print('Error: $e');
                      // Tampilkan pesan kesalahan kepada pengguna
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Error'),
                            content: Text('Terjadi kesalahan saat mengirim data.'),
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
