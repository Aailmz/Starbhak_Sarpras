import 'package:flutter/material.dart';


class HomeSiswa extends StatelessWidget {
  const HomeSiswa({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20.0), // Sesuaikan dengan kebutuhan Anda
        child: ListView(
          children: [
            Column(
              children: [
                Center(
                    child: Text(
                  "Pinjam Barang",
                  style: TextStyle(fontSize: 20),
                )),
                Padding(
                  padding: EdgeInsets.all(15),
                  child: SizedBox(
                    width: 350.0,
                    height: 50.0,
                    child: Container(
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 239, 234, 234),
                          borderRadius: BorderRadius.circular(10)),
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "Proyektor",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(15), // Padding di antara kontainer
                  child: SizedBox(
                    width: 350.0,
                    height: 50.0,
                    child: Container(
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 239, 234, 234),
                          borderRadius: BorderRadius.circular(10)),
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "Kabel Roll",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(15), // Padding di antara kontainer
                  child: SizedBox(
                    width: 350.0,
                    height: 50.0,
                    child: Container(
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 239, 234, 234),
                          borderRadius: BorderRadius.circular(10)),
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "Monitor",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(15), // Padding di antara kontainer
                  child: SizedBox(
                    width: 350.0,
                    height: 50.0,
                    child: Container(
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 239, 234, 234),
                          borderRadius: BorderRadius.circular(10)),
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "Laptop",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}