import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Random Word Translator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: RandomWordTranslator(),
    );
  }
}

class RandomWordTranslator extends StatefulWidget {
  @override
  _RandomWordTranslatorState createState() => _RandomWordTranslatorState();
}

class _RandomWordTranslatorState extends State<RandomWordTranslator> {
  final Random _random = Random();
  final Map<String, String> _translationDictionary = {
    'hello': 'merhaba',
    'world': 'dünya',
    'ibrahim': 'ibo',
    'look': 'bak',
    'do': 'yaptim:)',
    // Diğer çevirileri buraya ekleyebilirsiniz
  };

  String _randomWord = '';
  String _translatedWord = '';

  void _translateRandomWord() {
    setState(() {
      _randomWord = _getRandomWord();
      _translatedWord = _translationDictionary[_randomWord.toLowerCase()] ??
          'Çeviri bulunamadı';
    });
  }

  String _getRandomWord() {
    final List<String> keys = _translationDictionary.keys.toList();
    return keys[_random.nextInt(keys.length)];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Random Word Translator'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: _translateRandomWord,
                child: Text('Rastgele Kelime Getir ve Çevir'),
              ),
              SizedBox(height: 20),
              Text(
                'İngilizce Kelime: $_randomWord',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 10),
              Text(
                'Türkçe Çeviri: $_translatedWord',
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
