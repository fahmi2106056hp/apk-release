import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  // Function to launch URL
  void _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, // Membuat AppBar transparan
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 1, // Menghilangkan bayangan AppBar
        title: const Text(
          "About App",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white, // Mengubah warna teks menjadi putih
          ),
        ),
      ),
      body: Stack(
        children: [
          // Latar belakang gradien
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color.fromARGB(255, 5, 169, 181), Color.fromARGB(255, 8, 168, 179)], // Gradien warna biru
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          // Isi halaman
          SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 60), // Ruang untuk AppBar transparan
                // Gambar Profil
                const CircleAvatar(
                  radius: 100,
                  backgroundImage: AssetImage("assets/images/poto_aku.jpg"), // Path to your profile picture
                  backgroundColor: Colors.white, // Warna latar belakang jika gambar tidak dimuat
                ),
                const SizedBox(height: 20),
                
                // Nama
                Text(
                  "Fahmi Hadi Palaha",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // Warna teks menjadi putih
                    shadows: [
                      Shadow(
                        offset: Offset(2, 2),
                        blurRadius: 3,
                        color: Colors.black26,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                
                // Info Pendidikan
                const Text(
                  "Mahasiswa Teknik Informatika\nInstitut Teknologi Garut",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white70, // Warna teks lebih terang
                  ),
                ),
                const SizedBox(height: 20),
                
                // Info Kontak
                Card(
                  color: Colors.white.withOpacity(0.85),
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () => _launchURL('tel:+6285703189263'),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(Icons.phone, size: 20, color: Colors.blue),
                              SizedBox(width: 10),
                              Text(
                                "+6285703189263",
                                style: TextStyle(fontSize: 16, color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        InkWell(
                          onTap: () => _launchURL('mailto:2106056@itg.ac.id'),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(Icons.mail, size: 20, color: Colors.red),
                              SizedBox(width: 10),
                              Text(
                                "2106056@itg.ac.id",
                                style: TextStyle(fontSize: 16, color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(Icons.location_on, size: 20, color: Colors.green),
                            SizedBox(width: 10),
                            Text(
                              "Purwajaya, Garut",
                              style: TextStyle(fontSize: 16, color: Colors.black),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                
                // Copyright
                const SizedBox(height: 20),
                const Text(
                  "itg.ac.id © 2024",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
