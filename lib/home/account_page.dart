// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:responsei_app/home/profile_page.dart';

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Avatar and Profile Info
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.grey[300],
                        child: Icon(
                          Icons.person,
                          size: 40,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Zaedar Ghazalba",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "Universitas Teknologi Yogyakarta",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50),
            // Settings List
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.black),
              ),
              child: Column(
                children: [
                  ListTile(
                    title: const Text("Kelola Akun"),
                    trailing: const Icon(Icons.arrow_forward),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProfileScreen()),
                      );
                    },
                  ),
                  ListTile(
                    title: const Text("Notifikasi"),
                    trailing: const Icon(Icons.arrow_forward),
                    onTap: () {
                      // Navigasi ke halaman Notifikasi
                    },
                  ),
                  ListTile(
                    title: const Text("Tentang Aplikasi"),
                    trailing: const Icon(Icons.arrow_forward),
                    onTap: () {
                      // Navigasi ke halaman Tentang Aplikasi
                    },
                  ),
                  ListTile(
                    title: const Text("Privacy Policy"),
                    trailing: const Icon(Icons.arrow_forward),
                    onTap: () {
                      // Navigasi ke halaman Privacy Policy
                    },
                  ),
                  ListTile(
                    title: const Text("Terms of Service"),
                    trailing: const Icon(Icons.arrow_forward),
                    onTap: () {
                      // Navigasi ke halaman Terms of Service
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
