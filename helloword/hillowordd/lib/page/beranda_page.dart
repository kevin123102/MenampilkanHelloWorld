import 'package:cherry_toast/cherry_toast.dart';
import 'package:flutter/material.dart';
import 'package:hillowordd/page/profile_page.dart';
import 'package:simple_alert_dialog/simple_alert_dialog.dart';

// GLOBAL DATA (TETAP)
class GlobalData {
  static String summary = "";
  static String experience = "";
}

class BerandaPage extends StatefulWidget {
  const BerandaPage({super.key});

  @override
  State<BerandaPage> createState() => _BerandaPage();
}

class _BerandaPage extends State<BerandaPage> {

  final TextEditingController summaryController = TextEditingController();
  final TextEditingController experienceController = TextEditingController();

  @override
  void dispose() {
    summaryController.dispose();
    experienceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D1117),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Cyber Dashboard"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            cyberInput("Summary", summaryController),
            const SizedBox(height: 15),
            cyberInput("Experience", experienceController),

            const SizedBox(height: 25),

            InkWell(
              onTap: () {
                if (summaryController.text.isEmpty ||
                    experienceController.text.isEmpty) {

                  CherryToast.error(
                    title: const Text("Harap isi semua field!"),
                  ).show(context);
                  return;
                }

                SimpleAlertDialog.show(
                  context,
                  assetImagepath: AnimatedImage.confirm,
                  buttonsColor: Colors.green,
                  title: AlertTitleText("Konfirmasi"),
                  content: AlertContentText("Kirim ke profile?"),
                  onConfirmButtonPressed: (ctx) {

                    GlobalData.summary = summaryController.text;
                    GlobalData.experience = experienceController.text;

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ProfilePage(),
                      ),
                    );

                    CherryToast.success(
                      title: const Text("Berhasil dikirim!"),
                    ).show(context);

                    Navigator.pop(ctx);
                  },
                );
              },
              child: cyberButton("Submit", Colors.green),
            ),

            const SizedBox(height: 10),

            InkWell(
              onTap: () {
                summaryController.clear();
                experienceController.clear();

                GlobalData.summary = "";
                GlobalData.experience = "";

                CherryToast.success(
                  title: const Text("Data dihapus!"),
                ).show(context);
              },
              child: cyberButton("Delete", Colors.red),
            ),

            const SizedBox(height: 10),

            // ✅ TAMBAHAN SHOW DIALOG
            InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    backgroundColor: Color(0xFF161B22),
                    title: Text("Informasi",
                        style: TextStyle(color: Colors.cyanAccent)),
                    content: Text(
                      "Gunakan tombol submit untuk mengirim data ke profile.",
                      style: TextStyle(color: Colors.white70),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text("OK"),
                      )
                    ],
                  ),
                );
              },
              child: cyberButton("Show Dialog", Colors.blue),
            ),
          ],
        ),
      ),
    );
  }

  Widget cyberInput(String label, TextEditingController controller) {
    return TextField(
      controller: controller,
      style: const TextStyle(color: Colors.cyanAccent),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.cyanAccent),
        filled: true,
        fillColor: const Color(0xFF161B22),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.cyanAccent),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.greenAccent),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  Widget cyberButton(String text, Color color) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}