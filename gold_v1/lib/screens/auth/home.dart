import 'package:flutter/material.dart';
import 'package:gold_v1/screens/auth/login.dart';
import 'package:gold_v1/screens/auth/promision.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var logo = Image.asset(
      'assets/icon-ban.png',
      width: 100,
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // Header
            Container(
              height: 200,
              padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
              decoration: const BoxDecoration(
                color: Color(0xFF00674F),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      logo,
                      const Icon(
                        Icons.notifications_none,
                        color: Colors.white,
                        size: 30,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
      
            // Login/Registration Card
            Transform.translate(
              offset: const Offset(0, -100),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Color(0xFF00674F),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(color: Color(0xFFFFD700), blurRadius: 10),
                  ],
                ),
                child: Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const LoginPage()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFFD700),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                        minimumSize: const Size(double.infinity, 50),
                      ),
                      child: const Text(
                        "ເຂົ້າສູ່ລະບົບ",
                        style: TextStyle(
                          color: Color(0xFF00674F),
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: const [
                        Expanded(
                          child: Divider(color: Colors.white, thickness: 2, indent: 10, endIndent: 10),
                        ),
                        Text("ທ່ານຍັງບໍ່ມີບັນຊີ?", style: TextStyle(color: Colors.white)),
                        Expanded(
                          child: Divider(color: Colors.white, thickness: 2, indent: 10, endIndent: 10),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Promision()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF00674F),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                          side: const BorderSide(color: Colors.white),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                        minimumSize: const Size(double.infinity, 50),
                      ),
                      child: const Text(
                        "ລົງຖະບຽນ",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),  
            // Feature Icons
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Image.asset('assets/icon-ban.png', width: 50),
                      const SizedBox(height: 5),
                      const Text("ຊື້ຄຳ", style: TextStyle(color: Colors.black87)),
                    ],
                  ),
                  Column(
                    children: [
                      Image.asset('assets/icon-ban.png', width: 50),
                      const SizedBox(height: 5),
                      const Text("ຂາຍຄຳ", style: TextStyle(color: Colors.black87)),
                    ],
                  ),
                  Column(
                    children: [
                      Image.asset('assets/icon-ban.png', width: 50),
                      const SizedBox(height: 5),
                      const Text("ຖອນຄຳ", style: TextStyle(color: Colors.black87)),
                    ],
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
