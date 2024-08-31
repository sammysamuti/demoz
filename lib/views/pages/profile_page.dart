import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProfilePage extends StatelessWidget {
  final box = GetStorage();
  static String route = 'profile-page';

  @override
  Widget build(BuildContext context) {
    final email = box.read('companyEmail') ?? 'xxx@gmail.com';
    final phone = box.read('phone') ?? '+923123135';
    final address = box.read('address') ??
        AppLocalizations.of(context)!.addressOfTheCompany;
    final employees = box.read('employees') ?? '20';
    final tin = box.read('tin') ?? '123';
    final bank = box.read('accountNumber') ??
        AppLocalizations.of(context)!.bankAccountNumber;
    final companyname = box.read('companyName') ??
        AppLocalizations.of(context)!.bankAccountNumber;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          AppLocalizations.of(context)!.companyProfile,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: SizedBox(
              width: 24,
              height: 24,
              child: Image.asset('assets/images/settings.png'),
            ),
            onPressed: () {
              Get.toNamed('setting-page');
            },
          ),
        ],
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/images/man.png'),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.orange,
                      ),
                      child: Icon(
                        Icons.edit,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Text(
              companyname,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8),
            Text(
              'HR Manager',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),
            _buildTextField(
              icon: Icons.email,
              label: AppLocalizations.of(context)!.companyEmail,
              hint: email,
            ),
            SizedBox(height: 16),
            _buildTextField(
              icon: Icons.phone,
              label: AppLocalizations.of(context)!.phoneNumber,
              hint: phone,
            ),
            SizedBox(height: 16),
            _buildTextField(
              label: AppLocalizations.of(context)!.companyAddress,
              hint: address,
            ),
            SizedBox(height: 16),
            _buildTextField(
              label: AppLocalizations.of(context)!.numberOfEmployees,
              hint: employees,
            ),
            SizedBox(height: 16),
            _buildTextField(
              label: AppLocalizations.of(context)!.tinNumber,
              hint: tin,
            ),
            SizedBox(height: 16),
            _buildTextField(
              label: AppLocalizations.of(context)!.companyBank,
              hint: bank,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    IconData? icon,
    required String label,
    required String hint,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8),
        TextField(
          decoration: InputDecoration(
            prefixIcon: icon != null ? Icon(icon, color: Colors.grey) : null,
            hintText: hint,
            hintStyle: TextStyle(fontSize: 12, color: Colors.grey),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey),
            ),
          ),
        ),
      ],
    );
  }
}
