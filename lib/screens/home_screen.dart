import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key); // Constructor düzeltiliyor

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomeScreen(), // HomeScreen kullanılıyor
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Word Path'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Hoş Geldiniz!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Yeni oyunu başlatan kodları buraya ekleyin
              },
              child: const Text('Yeni Oyun Başlat'),
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () {
                // Seçenekler veya diğer ekranlara geçiş kodlarını buraya ekleyin
              },
              child: const Text('Seçenekler'),
            ),
          ],
        ),
      ),
    );
  }
}
