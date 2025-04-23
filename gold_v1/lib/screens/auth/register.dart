import 'package:flutter/material.dart';
import 'package:gold_v1/provider/auth_provider.dart';
import 'package:gold_v1/screens/auth/home.dart';
import 'package:provider/provider.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final form = GlobalKey<FormState>();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
    final TextEditingController pinController = TextEditingController();

  @override
  void dispose() {
    phoneController.dispose();
    passwordController.dispose();
    pinController.dispose();

    super.dispose();
  }

  void handleRegister() {
    String phoneNumber = phoneController.text.trim();
    String password = passwordController.text.trim();
    context.read<AuthProvider>().register(
      username: phoneNumber,
      userpassword: password,
      pinUser: pinController.text.trim(),
    );
    print(phoneController);
    if (form.currentState!.validate()) {
      form.currentState!.save();
    } else {
      showSnackBar("ກະລຸນາປ້ອນເບີໂທ ແລະ ລະຫັດຜ່ານ");
      return;
    }
    try {
    } catch (e) {
      showSnackBar("ກະລຸນາປ້ອນ PIN ທີ່ຖືກຕ້ອງ");
      return;
    }

    if (phoneNumber.isEmpty) {
      showSnackBar("user name");
    } else if (!RegExp('user_name').hasMatch(phoneNumber)) {
      showSnackBar("ເບີໂທບໍ່ຖືກຕ້ອງ");
    } else if (password.isEmpty || password.length < 6) {
      showSnackBar("ລະຫັດຜ່ານຕ້ອງມີຢ່າງນ້ອຍ 6 ຕົວອັກສອນ");
    } else {
      // Navigate or process registration
    }
  }

  void showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Form( key: form,
          child: Column(
            children: [
              // **Header Section**
              Container(
                padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 1),
                decoration: const BoxDecoration(
                  color: Color(0xFF00674F),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const HomePage()),
                      ),
                      child: Container(
                        height: 55,
                        width: 70,
                        decoration: const BoxDecoration(
                          color: Color(0xFF00936C),
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                        ),
                        child: const Icon(
                          Icons.home_outlined,
                          size: 35,
                          color: Color(0xFFFFD700),
                        ),
                      ),
                    ),
                    Image.asset(
                      'assets/icon-ban.png',
                      width: 150,
                    ),
                    const SizedBox(width: 70),
                  ],
                ),
              ),
                
              const SizedBox(height: 30),
              const Text(
                "ລົງທະບຽນ",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF00674F),
                ),
              ),
              const SizedBox(height: 5),
              const Text(
                "ກະລຸນາປ້ອນເບີໂທຂອງທ່ານ",
                style: TextStyle(fontSize: 14, color: Colors.black54),
              ),
                
              const SizedBox(height: 20),
              _buildInputField(phoneController, Icons.phone, "20 XXXXXXXX", false),
              const SizedBox(height: 20),
              _buildInputField(passwordController, Icons.lock, "ສ້າງລະຫັດຜ່ານ", true),
              const SizedBox(height: 20),
              _buildInputField(pinController, Icons.lock, "ສ້າງ PIN", true),
                
              const SizedBox(height: 150),
              ElevatedButton(
                onPressed: handleRegister,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF00674F),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  minimumSize: const Size(double.infinity, 60),
                ),
               
                child: const Text(
                  "ຕໍ່ໄປ",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputField(TextEditingController controller, IconData icon, String hint, bool obscure) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(15),
        child: Row(
          children: [
            Icon(icon, color: Colors.black54, size: 30),
            const SizedBox(width: 10),
            Expanded(
              child: TextField(
                controller: controller,
                obscureText: obscure,
                keyboardType: obscure ? TextInputType.text : TextInputType.phone,
                decoration: InputDecoration(
                  hintText: hint,
                  hintStyle: const TextStyle(fontSize: 16, color: Colors.black54),
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}