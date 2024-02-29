import 'package:flutter/material.dart';
import 'package:starbhak_sarpras/main.dart';
import 'package:starbhak_sarpras/home_siswa.dart';
import 'package:starbhak_sarpras/terminator.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginSiswa extends StatelessWidget {
  final TextEditingController _emailSiswaController = TextEditingController();
  final TextEditingController _passwordSiswaController = TextEditingController();
  final supabase = Supabase.instance.client;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xA2C7A2),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                      'assets/images/SARPRAS_LOGO.png',
                      width: 100.0,
                      height: 100.0,
                    ),
              Text(
                'Sarpras',
                style: TextStyle(
                        fontSize: 30.0,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        shadows: [
                          Shadow(
                            offset: Offset(0.0, 1.0),
                            blurRadius: 5.0,
                            color: Colors.black,
                          ),
                        ],
                      ),
              ),
              Column(
                children: [
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
                    controller: _passwordSiswaController,
                    obscureText: true,
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
                  final password = _passwordSiswaController.text;
                    final AuthResponse res = await supabase.auth.signInWithPassword(
                    password: password, email: email
                    );
                    final Session? session = res.session;
                    final User? user = res.user;
                    Navigator.of(context).push(
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) => HomeSiswa(),
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
                  'Masuk',
                  style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Poppins', color: Colors.black),
                ),
              ),
              SizedBox(height: 10,),
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) => Terminator(),
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
                    Icon(
                      Icons.arrow_back, // Change to the appropriate icon
                      color: Colors.grey[500],
                    ),
                    SizedBox(width: 5), // Add some space between the icon and text
                    Text(
                      'Kembali',
                      style: TextStyle(color: Colors.grey[500], fontFamily: 'Poppins', fontWeight: FontWeight.w100),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
