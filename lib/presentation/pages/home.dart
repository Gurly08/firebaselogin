import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 241, 234, 255),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(0, 252, 252, 252),
          elevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const CircleAvatar(
                foregroundImage: AssetImage("assets/images/ppaku.jpg"),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Bagas Djunaedi",
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.purple[900],
                      ),
                    ),
                  ),
                  Text(
                    "Selaamat Siang -__-",
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.normal,
                        color: Colors.black38,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.notifications, size: 25),
              color: Colors.blue[900],
              onPressed: () {
                // Tambahkan fungsi yang akan dipanggil saat ikon notifikasi diklik
                // Misalnya, tampilkan pesan notifikasi
                //
              },
            ),
          ],
          automaticallyImplyLeading: false,
        ),
        body: const Padding(
          padding: EdgeInsets.all(18),
          child: Center(
            child: Text('Selamat Datang Kembali'),
          ),
        ),
      ),
    );
  }
}