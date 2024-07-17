import 'package:flutter/material.dart';
import 'package:wordpath/database/database_helper.dart';
import 'package:wordpath/model/WordPair.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final dbHelper =
      DatabaseHelper.instance; // DatabaseHelper instance oluşturuluyor

  // Örnek veritabanı işlemi: Kelime çifti eklemek
  await dbHelper.insertWordPair({
    'english_word': 'book',
    'turkish_translation': 'kitap',
  } as WordPair); // Örnek bir kelime çifti ekliyoruz

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Word Path')),
        body: Center(
          child: FutureBuilder<List<Map<String, dynamic>>>(
            future: DatabaseHelper.instance.queryAllWordPairs(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) return const CircularProgressIndicator();
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title:
                        Text(snapshot.data![index]['english_word'] as String),
                    subtitle: Text(
                        snapshot.data![index]['turkish_translation'] as String),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
