import 'package:flutter/material.dart';
import 'package:gold_v1/screens/auth/home.dart';
import 'package:gold_v1/screens/auth/promision.dart';
import 'package:gold_v1/screens/auth/pin_login.dart';

bool isChecked = false;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String userPhoneNumber = "";
  TextEditingController passwordController =
      TextEditingController(); // Password Controller
  bool _showInput = false; // Variable to toggle input visibility
  final TextEditingController _passwordController =
      TextEditingController(); // Password Controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                width: 500,
                height: 600,
                decoration: BoxDecoration(
                  color: Color(0xFF00674F),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
              ),
              Column(
                children: [
                  SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap:
                            () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomePage(),
                              ),
                            ),
                        child: Container(
                          height: 55,
                          width: 70,
                          decoration: BoxDecoration(
                            color: Color(0xFF00936C),
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            ),
                          ),
                          child: Icon(
                            Icons.home_outlined,
                            size: 35,
                            color: Color(0xFFFFD700),
                          ),
                        ),
                      ),
                      Image.asset('assets/icon-ban.png', width: 150),
                      Text(
                        "LA",
                        style: TextStyle(
                          fontSize: 25,
                          color: Color(0xFFFFD700),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 70),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person, color: Colors.white),
                        suffixIcon: GestureDetector(
                          onTap: () {},
                          child: Icon(Icons.close, color: Colors.white),
                        ),
                        hintText:
                            userPhoneNumber.isEmpty
                                ? "ປ້ອນເບີເບີໂທຂອງທ່ານ"
                                : userPhoneNumber,
                        hintStyle: TextStyle(color: Colors.white),
                        labelText: "ປ້ອນເບີໂທຂອງທ່ານ",
                        labelStyle: TextStyle(color: Colors.white),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          userPhoneNumber = value;
                        });
                      },
                    ),
                  ),
                  SizedBox(height: 3),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        Checkbox(
                          checkColor: Color(0xFF00936C),
                          value: isChecked,
                          onChanged: (bool? value) {
                            setState(() {
                              isChecked = value ?? false;
                            });
                          },
                          activeColor: Colors.white,
                        ),
                        Text(
                          "REMEMBER ME",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 5),
Padding(
  padding: EdgeInsets.symmetric(horizontal: 20),
  child: SizedBox(
    width: double.infinity,
    height: 50,
    child: OutlinedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PinLogin(), // Replace with your target page
          ),
        );
      },
      style: OutlinedButton.styleFrom(
        backgroundColor: Color(0xFFFFD700),
        padding: EdgeInsets.symmetric(vertical: 12),
        side: BorderSide(color: Color(0xFFFFD700)),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Text(
        "ເຂົ້າລະບົບດ້ວຍ PIN",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    ),
  ),
),



                  SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: SizedBox(
                      width: double.infinity,
                      height: 50,
                      child:
                          _showInput
                              ? TextField(
                                cursorColor: Colors.white,
                                controller: _passwordController,
                                obscureText: true,
                                decoration: InputDecoration(
                                  hintText: "ປ້ອນລະຫັດຜ່ານ",
                                  hintStyle: TextStyle(color: Colors.white),
                                  prefixIcon: Icon(Icons.lock, color: Colors.white),
                                  suffixIcon: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _showInput = false;
                                      });
                                    },
                                    child: Icon(Icons.close, color: Colors.white),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                    vertical: 12,
                                    horizontal: 16,
                                  ),
                                ),
                              )
                              : OutlinedButton(
                                onPressed: () {
                                  setState(() {
                                    _showInput = true;
                                  });
                                },
                                style: OutlinedButton.styleFrom(
                                  padding: EdgeInsets.symmetric(vertical: 12),
                                  side: BorderSide(color: Colors.white),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                child: Text(
                                  "ເຂົ້າລະບົບດ້ວຍລະຫັດຜ່ານ",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                    ),
                  ),
                  SizedBox(height: 200),
                  GestureDetector(
                    onTap:
                        () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Promision()),
                        ),
                    child: Text(
                      "ບໍ່ມີບັນຊີບໍ? ລົງທະບຽນໃໝ່",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF00936C),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
