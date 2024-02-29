import 'package:flutter/material.dart';
import 'package:starbhak_sarpras/login_admin.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CreateBarang extends StatefulWidget {
  @override
  _CreateBarangState createState() => _CreateBarangState();
}

class _CreateBarangState extends State<CreateBarang> {
  final TextEditingController _jenisBarangController = TextEditingController();
  final TextEditingController _merkBarangController = TextEditingController();
  final TextEditingController _stokBarangController = TextEditingController();
  final TextEditingController _noteBarangController = TextEditingController();
  final supabase = Supabase.instance.client;
  String? _selectedJenisBarang;
  List<String> _jenisBarangList = [];


  @override
  void initState() {
    super.initState();
    _fetchJenisBarang();
  }

  Future<void> _fetchJenisBarang() async {
    // Correctly build the query and execute it to fetch data
    final response = await supabase
        .from('jenis_barang')
        .select('jenis_barang');

    final List<dynamic> jenisBarangRecords = response;
    setState(() {
      _jenisBarangList = jenisBarangRecords.map((record) => record['jenis_barang'].toString()).toList();
    });
  }


  void _showSuccessModal(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Berhasil!"),
          content: Text("Data barang berhasil ditambahkan."),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Done"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(150),
        child: SafeArea(
          child: Container(
            height: 70,
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/SARPRAS_LOGO.png',
                  width: 40.0,
                  height: 40.0,
                ),
                SizedBox(width: 10,),
                Text('Sarpras', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                SizedBox(width: 120,),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) => LoginAdmin(),
                        transitionsBuilder: (context, animation, secondaryAnimation, child) {
                          const begin = 0.0;
                          const end = 1.0;
                          var curve = Curves.easeInOut;
                          var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                          var offsetAnimation = animation.drive(tween);

                          return FadeTransition(
                            opacity: offsetAnimation,
                            child: child,
                          );
                        },
                      ),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Kembali',
                        style: TextStyle(color: Colors.red[500], fontFamily: 'Poppins', fontWeight: FontWeight.w100),
                      ),
                      SizedBox(width: 5),
                      Icon(
                        Icons.arrow_right, // Change to the appropriate icon
                        color: Colors.red[500],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ),
      ),
      body: Container(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text('Tambah Barang', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.grey[600]),),
                  SizedBox(height: 20.0), // Spacing before "Nama Siswa"
                  DropdownButton<String>(
                    value: _selectedJenisBarang,
                    onChanged: (String? newValue) { // Nullable String
                      setState(() {
                        _selectedJenisBarang = newValue;
                        _jenisBarangController.text = _selectedJenisBarang ?? '';
                      });
                    },
                    items: _jenisBarangList.map((String item) {
                      return DropdownMenuItem<String>(
                        value: item,
                        child: Text(item),
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 20.0), // Spacing before "Nama Siswa"
                  TextField(
                    controller: _merkBarangController,
                    style: TextStyle(fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                      labelText: 'Merk',
                      labelStyle: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.black.withOpacity(0.3), // Set opacity to 80%
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      filled: true,
                      fillColor: Colors.grey[100],
                    ),
                  ),
                  SizedBox(height: 20.0), // Spacing before "Password"
                  TextField(
                    controller: _stokBarangController,
                    style: TextStyle(fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                      labelText: 'Stok',
                      labelStyle: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.black.withOpacity(0.3), // Set opacity to 80%
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      filled: true,
                      fillColor: Colors.grey[100],
                    ),
                  ),
                  SizedBox(height: 20.0), // Spacing before "Password"
                  TextField(
                    controller: _noteBarangController,
                    style: TextStyle(fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                      labelText: 'Note',
                      labelStyle: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.black.withOpacity(0.3), // Set opacity to 80%
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      filled: true,
                      fillColor: Colors.grey[100],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 32.0),
              ElevatedButton(
                onPressed: () async {
                  final jenis = _jenisBarangController.text;
                  final merk = _merkBarangController.text;
                  final stok = _stokBarangController.text;
                  final note = _noteBarangController.text;

                  final data = await supabase
                    .from('barang')
                    .insert({'merk': merk,'jenis': jenis, 'stok': stok, 'note': note});
                      
                    _showSuccessModal(context);
                    _jenisBarangController.clear();
                    _merkBarangController.clear();
                    _stokBarangController.clear();
                    _noteBarangController.clear();
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.greenAccent),
                  fixedSize: MaterialStateProperty.all<Size>(
                    Size(500.0, 50.0), // Set the width and height of the button
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                child: Text(
                  'Tambah',
                  style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Poppins', color: Colors.black),
                ),
              ),
              SizedBox(height: 10,),
          
            ],
          ),
        ),
      ),
    );
  }
}
