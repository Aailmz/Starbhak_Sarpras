
import 'package:flutter/material.dart';

class SiswaPage extends StatefulWidget {
  const SiswaPage({Key? key}) : super(key: key);

  @override
  _SiswaPageState createState() => _SiswaPageState();
}

class _SiswaPageState extends State<SiswaPage> {
  String selectedValue = '1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            children: [
              Center(
                child: Text(
                  "Pinjam Barang",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 237, 237, 237),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 15),
                            child: Text(
                              "Proyektor",
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 5, right: 5),
                            child: Text(
                              "HITACHI",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 60, top: 15),
                            child: Text(
                              "Note:",
                              style: TextStyle(fontSize: 10),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 15),
                            child: Text(
                              "Meledak jika Overheat",
                              style: TextStyle(fontSize: 10),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 120),
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 90),
                              child: Text(
                                "Stok:",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: 15, left: 90),
                              child: Text(
                                "10",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                              width: 130,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      Color.fromARGB(255, 38, 235, 175),
                                ),
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return StatefulBuilder(
                                        builder: (context, setState) {
                                          return AlertDialog(
                                            title: Text(
                                              "Jumlah Pinjam",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w200),
                                            ),
                                            content: Container(
                                              width: double.maxFinite,
                                              child: DropdownButton<String>(
                                                value: selectedValue,
                                                onChanged: (String? newValue) {
                                                  setState(() {
                                                    selectedValue = newValue!;
                                                  });
                                                },
                                                isExpanded: true,
                                                items: <String>[
                                                  '1',
                                                  '2',
                                                  '3'
                                                ].map<DropdownMenuItem<String>>(
                                                  (String value) {
                                                    return DropdownMenuItem<
                                                        String>(
                                                      value: value,
                                                      child: Text(value),
                                                    );
                                                  },
                                                ).toList(),
                                              ),
                                            ),
                                            actions: [
                                              ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        Color.fromARGB(
                                                            255, 38, 235, 175)),
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Text(
                                                  "Pinjam",
                                                  style: TextStyle(
                                                      color: Colors.black),
                                                ),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    },
                                  );
                                },
                                child: Text(
                                  "Pinjam",
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 237, 237, 237),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 15),
                            child: Text(
                              "Proyektor",
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 20, top: 5),
                            child: Text(
                              "EPSON",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 60, top: 15),
                            child: Text(
                              "Note:",
                              style: TextStyle(fontSize: 10),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 15),
                            child: Text(
                              "Meledak jika Overheat",
                              style: TextStyle(fontSize: 10),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 120),
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 90),
                              child: Text(
                                "Stok:",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: 15, left: 90),
                              child: Text(
                                "0",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                              width: 130,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      Color.fromARGB(255, 38, 235, 175)
                                          .withOpacity(0.3),
                                ),
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return StatefulBuilder(
                                        builder: (context, setState) {
                                          return AlertDialog(
                                            title: Text(
                                              "Jumlah Pinjam",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w200),
                                            ),
                                            content: Container(
                                              width: double.maxFinite,
                                              child: DropdownButton<String>(
                                                value: selectedValue,
                                                onChanged: (String? newValue) {
                                                  setState(() {
                                                    selectedValue = newValue!;
                                                  });
                                                },
                                                isExpanded: true,
                                                items: <String>[
                                                  '1',
                                                  '2',
                                                  '3'
                                                ].map<DropdownMenuItem<String>>(
                                                  (String value) {
                                                    return DropdownMenuItem<
                                                        String>(
                                                      value: value,
                                                      child: Text(value),
                                                    );
                                                  },
                                                ).toList(),
                                              ),
                                            ),
                                            actions: [
                                              ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        Color.fromARGB(
                                                            255, 38, 235, 175)),
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Text(
                                                  "Pinjam",
                                                  style: TextStyle(
                                                      color: Colors.black),
                                                ),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    },
                                  );
                                },
                                child: Text(
                                  "Pinjam",
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.5)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}