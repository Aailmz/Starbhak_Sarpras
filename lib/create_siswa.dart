import 'package:flutter/material.dart';
import 'package:starbhak_sarpras/login_admin.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CreateSiswa extends StatelessWidget {
  final TextEditingController _emailSiswaController = TextEditingController();
  final TextEditingController _namaSiswaController = TextEditingController();
  final TextEditingController _kelasSiswaController = TextEditingController();
  final TextEditingController _passwordSiswaController = TextEditingController();
  final supabase = Supabase.instance.client;

  void _showSuccessModal(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Berhasil!"),
          content: Text("Data siswa berhasil ditambahkan."),
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
                  Text('Tambah Siswa', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.grey[600]),),
                  SizedBox(height: 20.0), // Spacing before "Nama Siswa"
                  TextField(
                    controller: _emailSiswaController,
                    style: TextStyle(fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                      labelText: 'Email Siswa',
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
                    controller: _namaSiswaController,
                    style: TextStyle(fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                      labelText: 'Nama',
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
                    controller: _kelasSiswaController,
                    style: TextStyle(fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                      labelText: 'Kelas',
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
                    controller: _passwordSiswaController,
                    style: TextStyle(fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                      labelText: 'Password',
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
                  final email = _emailSiswaController.text;
                  final nama = _namaSiswaController.text;
                  final kelas = _kelasSiswaController.text;
                  final password = _passwordSiswaController.text;
                    
                  final AuthResponse res = await supabase.auth.signUp(
                    email: email,
                    password: password,
                    data: {'Nama': nama, 'Kelas': kelas},
                  );
                  final data = await supabase
                    .from('siswa')
                    .insert({'email_siswa': email,'nama_siswa': nama, 'kelas_siswa': kelas, 'password_siswa': password});
                      
                  final Session? session = res.session;
                  final User? user = res.user;

                  // Show success modal and clear text fields
                  if (user != null) {
                    _showSuccessModal(context);
                    _emailSiswaController.clear();
                    _namaSiswaController.clear();
                    _kelasSiswaController.clear();
                    _passwordSiswaController.clear();
                  }
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
