// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Çeviri Uygulaması',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TranslateScreen(),
    );
  }
}

class TranslateScreen extends StatefulWidget {
  @override
  _TranslateScreenState createState() => _TranslateScreenState();
}

class _TranslateScreenState extends State<TranslateScreen> {
  TextEditingController _textEditingController = TextEditingController();
  String _translatedText = '';

  Future<void> _translate(String text) async {
    final response = await http.get(Uri.parse(
        'https://translate.googleapis.com/translate_a/single?client=gtx&sl=en&tl=tr&dt=t&q=$text'));

    if (response.statusCode == 200) {
      final decoded = json.decode(response.body);
      setState(() {
        _translatedText = decoded[0][0][0];
      });
    } else {
      throw Exception('Failed to load translation');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Çeviri Uygulaması'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _textEditingController,
              decoration: InputDecoration(
                hintText: 'Çevrilecek metni girin...',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                _translate(_textEditingController.text);
              },
              child: Text('Çevir'),
            ),
            SizedBox(height: 16.0),
            Text(
              _translatedText,
              style: TextStyle(fontSize: 18.0),
            ),
          ],
        ),
      ),
    );
  }
}
