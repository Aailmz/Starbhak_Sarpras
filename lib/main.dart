import 'package:flutter/material.dart';
import 'package:starbhak_sarpras/create_barang.dart';
import 'package:starbhak_sarpras/create_siswa.dart';
import 'package:starbhak_sarpras/login_siswa.dart';
import 'package:starbhak_sarpras/splash_screen.dart';
import 'package:starbhak_sarpras/terminator.dart';
import 'package:starbhak_sarpras/testes.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://ulzqwxzeboithvedbskm.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InVsenF3eHplYm9pdGh2ZWRic2ttIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDY3NjcwNjksImV4cCI6MjAyMjM0MzA2OX0.c4VGgQtK5_61b6hrJylylndnQSQMQ2GcchEz1OxT_Yc',
  );

  runApp(MyApp());
}

// Get a reference your Supabase client
final supabase = Supabase.instance.client;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CreateBarang(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: SiswaPage(),
      ),
      ),
    );
  }
}

