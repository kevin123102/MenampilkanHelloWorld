import 'package:flutter/material.dart';
import 'package:hillowordd/page/beranda_page.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D1117),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.zero,
          child: Column(
            children: [

              // 🔥 HEADER
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      'https://img.lazcdn.com/g/ff/kf/Sbae146c5eab64b9f99ea8a5b739c287eQ.jpg_720x720q80.jpg',
                    ),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.7),
                      BlendMode.darken,
                    ),
                  ),
                ),
                child: Container(
                  width: double.infinity,
                  height: 220,
                  child: Container(
                    alignment: Alignment(0.0, 2.5),
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.cyanAccent,
                          width: 3,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.cyanAccent.withOpacity(0.6),
                            blurRadius: 20,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      child: CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/images/profile.jpeg'),
                        radius: 60.0,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 70),

              // 🔥 NAMA
              Text(
                "Mohammad Kevin Wibisono",
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.cyanAccent,
                  letterSpacing: 1.5,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              Text(
                "Tangerang Kota, Indonesia",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white70,
                  letterSpacing: 1.2,
                ),
              ),

              const SizedBox(height: 10),

              // 🔥 ROLE
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.cyanAccent),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  "Cyber Security Specialist",
                  style: TextStyle(
                    color: Colors.cyanAccent,
                    fontSize: 13,
                    letterSpacing: 1.2,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // 🔥 CARD PROJECT & FOLLOWERS (TIDAK DIUBAH STRUKTUR)
              Card(
                color: const Color(0xFF161B22),
                elevation: 10,
                shadowColor: Colors.cyanAccent.withOpacity(0.5),
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                  side: BorderSide(color: Colors.cyanAccent, width: 1),
                ),
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [

                      Expanded(
                        child: Column(
                          children: [
                            Icon(Icons.code, color: Colors.cyanAccent),
                            SizedBox(height: 5),
                            Text(
                              "Project",
                              style: TextStyle(
                                color: Colors.cyanAccent,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "20", // tetap default (tidak diubah)
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ),

                      Container(
                        height: 50,
                        width: 1,
                        color: Colors.cyanAccent,
                      ),

                      Expanded(
                        child: Column(
                          children: [
                            Icon(Icons.people, color: Colors.cyanAccent),
                            SizedBox(height: 5),
                            Text(
                              "Followers",
                              style: TextStyle(
                                color: Colors.cyanAccent,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "2700", // tetap default (tidak diubah)
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 30),

              // 🔥 SKILLS
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Skills",
                        style: TextStyle(
                          color: Colors.cyanAccent,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Wrap(
                      spacing: 10,
                      children: [
                        chipSkill("Penetration Testing"),
                        chipSkill("Network Security"),
                        chipSkill("Ethical Hacking"),
                        chipSkill("Digital Forensics"),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // 🔥 SUMMARY
              sectionText("Summary", GlobalData.summary),

              const SizedBox(height: 20),

              // 🔥 EXPERIENCE
              sectionText("Experience", GlobalData.experience),

              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }

  Widget chipSkill(String text) {
    return Chip(
      label: Text(
        text,
        style: TextStyle(color: Colors.cyanAccent, fontSize: 12),
      ),
      backgroundColor: Color(0xFF161B22),
      side: BorderSide(color: Colors.cyanAccent),
    );
  }

  Widget sectionText(String title, String content) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              title,
              style: TextStyle(
                color: Colors.cyanAccent,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 8),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Color(0xFF161B22),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.cyanAccent),
            ),
            child: Text(
              content.isEmpty ? "-" : content,
              style: TextStyle(color: Colors.white70),
            ),
          ),
        ],
      ),
    );
  }
}