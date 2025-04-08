import 'package:flutter/material.dart';
import 'package:gold_v1/screens/auth/home.dart';
import 'package:gold_v1/screens/auth/register.dart';

class Promision extends StatefulWidget {
  const Promision({super.key});

  @override
  State<Promision> createState() => _PromisionState();
}

class _PromisionState extends State<Promision> {
  bool _isChecked = false; // State variable for checkbox

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Header
          _buildHeader(),
          // Home Button and Image
          _buildHomeButtonAndImage(),
          // Content
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  _buildTitle(),
                  // Content from fftest.jpg
                  _buildContent(),
                  // Checkbox and Next Button
                  _buildCheckboxAndNextButton(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 45, horizontal: 20),
      decoration: BoxDecoration(
        color: const Color(0xFF00674F),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
      ),
      child: const Center(
        child: Text(
          "ຂໍ້ກຳນົດແລະນະໂຍບາຍ",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildHomeButtonAndImage() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 17, horizontal: 1),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Home Button
          GestureDetector(
            onTap:
                () => Navigator.push(
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
          // Centered Image
          Image.asset('assets/icon-ban.png', width: 150),
          // Placeholder for UI Balance
          const SizedBox(width: 60),
        ],
      ),
    );
  }

  Widget _buildTitle() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Text(
        "ສັນຍາ ຊື້-ຂາຍ ຄໍາຜ່ານແອັບພີເຄຊັ້ນ ຊື້-ຂາຍ ຄໍາສະສົມ ເທື່ອລະໜ້ອຍຄູ່ສັນຍາເຂົ້າໃຈ ແລະ ຕົກລົງວ່າ:",
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: const Color(0xFF00674F),
        ),
      ),
    );
  }

  Widget _buildContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        Text(
          "ແອັບພິເຄຊັ້ນ IDEV GOLD BY 3CW3 ມີຂຶ້ນເພື່ອເປັນຊ່ອງທາງ ແລະ ອໍານວຍຄວາມ ສະດວກໃຫ້ລູກຄ້າສົ່ງຄໍາສັ່ງຊື້ຂາຍຄໍາໃຫ້ແກ່ບໍລິສັດ. ເພື່ອເຮັດການຊື້ຂາຍຄໍາ ລະຫວ່າງລູກຄ້າ ແລະ ບໍລິສັດລວມເຖິງສົ່ງຄໍາສັ່ງຂໍຮັບຄໍາອອກຈາກບັນຊີຊື້ຂາຍ ຄໍາທີ່เปิดไว้กับບໍລິສັດ ຫຼື ຄໍາສັ່ງອື່ນໃດຕາມທີ່ຈະກຳນົດໃຫ້ສົ່ງຜ່ານແອັບພິเถ ຊັ້ນ IDEV GOLD BY 3CW3 ໄດ້. ແອັບພິເຄຊັ້ນ IDEV GOLD BY 3CW3 ຈະເຊື່ອມໂຍງກັບບັນຊີ ທະນາຄານຂອງລູກຄ້າທີ່ໃຫ້ໄວ້ເຖິງແອັບພິເຄຊັ້ນ IDEV GOLD BY 3CW3 ແລະ ຂອງ ບໍລິສັດສໍາລັບການຊຳລະ ແລະ ຮັບຊຳລະເງິນພາຍໃຕ້ການຊື້ຂາຍຄໍາ. ລູກຄ້າ ແຕ່ລະລາຍຈະມີບັນຊີ IDEV GOLD BY 3CW3 ຂອງຕົນເອງຊຶ່ງເປັນບັນຊີຈໍາລອງທາງອີ ເລັກໂທນິກ VirtualAccount ທີ່ຈະສະແດງລາຍລະອຽດຕ່າງໆຂອງບັນຊີ ຊື້ຂາຍຄໍາທີ່ລູກຄ້າເປີດໄວ້ກັບບໍລິສັດໂດຍການເຂົ້າເຖິງບັນຊີ IDEV GOLD BY 3CW3 ຈະ ຕ້ອງຜ່ານແອັບພິເຄຊັ້ນ IDEV GOLD BY 3CW3 ເທົ່ານັ້ນ. ລູກຄ້າຍອມຮັบว่าได้ອ່ານ และ เຂົ້າใจຂໍ້ຄວາມທີ່ปะກົດເຖິງສັນຍານີ້ໂດຍຕະຫຼອດແລ້ວເຫັນວ່າຖືກຕ້ອງ ຕາມເຈດຕະນາຂອງຕົນທຸກປະການ ແລະ ເປັນທຳ. ຈຶ່ງລົງລາຍມີຊື້ດ້ວຍວິທີທາງ ອີເລັກໂທນິກໃນສັນຍາເພື່ອເປັນຫຼັກຖານໃນການເຂົ້າເຮັດທຸລະກຳກັບບໍລິສັດ.",
          style: TextStyle(fontSize: 14, color: Colors.black87),
        ),
        const SizedBox(height: 20),
        Text("2025", style: TextStyle(fontSize: 14, color: Colors.black87)),
      ],
    );
  }

  Widget _buildCheckboxAndNextButton() {
    return Column(
      children: [
        // Checkbox
        Row(
          children: [
            Checkbox(
              value: _isChecked,
              onChanged: (bool? value) {
                setState(() {
                  _isChecked = value ?? false;
                });
              },
            ),
            const Text(
              "ຂ້ອຍຍອມຮັບຂໍ້ກຳນົດແລະນະໂຍບາຍ",
              style: TextStyle(fontSize: 14, color: Color.fromARGB(221, 0, 0, 0)),
            ),
          ],
        ),
        const SizedBox(height: 20),
        // Next Button
        ElevatedButton(
          onPressed:
              _isChecked
                  ? () {
                    // Navigate to the next screen or perform an action
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Register()),
                    );
                  }
                  : null, // Disable button if checkbox is not checked
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF00674F),
            padding: const EdgeInsets.symmetric(vertical: 20),
            minimumSize: const Size(double.infinity, 60),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: const Text(
            "ຕໍ່ໄປ",
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
