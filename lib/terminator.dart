import 'package:flutter/material.dart';
import 'package:starbhak_sarpras/login_siswa.dart';
import 'package:starbhak_sarpras/login_admin.dart';

class Terminator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xA2C7A2),
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Image.asset(
                      'assets/images/SARPRAS_LOGO.png',
                      width: 200.0,
                      height: 200.0,
                    ),
                    Text(
                      'Selamat Datang!',
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
                    Text(
                      'Silahkan Login untuk melanjutkan.',
                      style: TextStyle(
                        fontSize: 12.0,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w100,
                        color: Colors.grey[500],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 50.0),
                Column(
                  children: [
                    Text(
                      'Login sebagai',
                      style: TextStyle(
                        fontSize: 15.0,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[600],
                      ),
                    ),
                    SizedBox(height: 20,),
                    ElevatedButton.icon(
                      onPressed: () {
                        Navigator.of(context).push(
                          PageRouteBuilder(
                            pageBuilder: (context, animation, secondaryAnimation) => LoginSiswa(),
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
                      style: ElevatedButton.styleFrom(
                        primary: Colors.greenAccent,
                        fixedSize: Size(300.0, 50.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        shadowColor: Colors.black,
                        elevation: 5.0,
                      ),
                      icon: Icon(Icons.person, color: Colors.black),
                      label: Text(
                        'Siswa',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins',
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    ElevatedButton.icon(
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
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 236, 236, 236),
                        fixedSize: Size(300.0, 50.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        shadowColor: Colors.black,
                        elevation: 5.0,
                      ),
                      icon: Icon(Icons.admin_panel_settings, color: Colors.black),
                      label: Text(
                        'Admin',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins',
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
