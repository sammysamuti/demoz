import 'package:flutter/material.dart';

class RegisterCompanyPage extends StatefulWidget {
  static String route = 'signup-page';
  @override
  _RegisterCompanyPageState createState() => _RegisterCompanyPageState();
}

class _RegisterCompanyPageState extends State<RegisterCompanyPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _companyNameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _tinController = TextEditingController();
  final TextEditingController _employeesController = TextEditingController();
  final TextEditingController _bankController = TextEditingController();
  final TextEditingController _accountNumberController =
      TextEditingController();

  @override
  void initState() {
    super.initState();
    _companyNameController.addListener(_updateFormState);
    _addressController.addListener(_updateFormState);
    _phoneController.addListener(_updateFormState);
    _tinController.addListener(_updateFormState);
    _employeesController.addListener(_updateFormState);
    _bankController.addListener(_updateFormState);
    _accountNumberController.addListener(_updateFormState);
  }

  void _updateFormState() {
    setState(() {});
  }

  @override
  void dispose() {
    _companyNameController.removeListener(_updateFormState);
    _addressController.removeListener(_updateFormState);
    _phoneController.removeListener(_updateFormState);
    _tinController.removeListener(_updateFormState);
    _employeesController.removeListener(_updateFormState);
    _bankController.removeListener(_updateFormState);
    _accountNumberController.removeListener(_updateFormState);

    _companyNameController.dispose();
    _addressController.dispose();
    _phoneController.dispose();
    _tinController.dispose();
    _employeesController.dispose();
    _bankController.dispose();
    _accountNumberController.dispose();
    super.dispose();
  }

  bool get _isFormValid {
    return _formKey.currentState?.validate() ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Register your Company',
                          style: TextStyle(
                              fontSize: 26, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(width: 8),
                        Row(
                          children: [
                            Text(
                              'to',
                              style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              ' Demoz Payroll',
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.w500,
                                color:
                                    Colors.blue,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Register your company to continue',
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                        SizedBox(height: 30),
                        _buildTextField(
                            _companyNameController, 'Company name', false),
                        SizedBox(height: 16),
                        _buildTextField(_addressController,
                            'Address of the company', false),
                        SizedBox(height: 16),
                        _buildTextField(_phoneController, 'Phone Number', true),
                        SizedBox(height: 16),
                        _buildTextField(_tinController, 'Tin Number', true),
                        SizedBox(height: 16),
                        _buildTextField(
                            _employeesController, 'Number of employees', true),
                        SizedBox(height: 16),
                        _buildTextField(_bankController, 'Company bank', false),
                        SizedBox(height: 16),
                        _buildTextField(_accountNumberController,
                            'Bank account number', true),
                        SizedBox(height: 30),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ElevatedButton(
                onPressed: _isFormValid
                    ? () {
                        if (_formKey.currentState!.validate()) {

                        }
                      }
                    : null,
                child: Center(
                  child: Text(
                    'Submit for approval',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50),
                  backgroundColor:
                      _isFormValid ? Colors.blue : Colors.grey.shade300,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(
      TextEditingController controller, String labelText, bool isNumeric) {
    return Stack(
      children: [
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
            labelText: null,
            contentPadding: EdgeInsets.symmetric(vertical: 25, horizontal: 10),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: Color.fromARGB(255, 227, 227, 227),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: Colors.blue,
                width: 2.0,
              ),
            ),
          ),
          keyboardType: isNumeric ? TextInputType.number : TextInputType.text,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'This field is required';
            }
            if (isNumeric && !RegExp(r'^[0-9]+$').hasMatch(value)) {
              return 'Please enter a valid number';
            }
            return null;
          },
          style: TextStyle(fontSize: 16),
        ),
        Positioned(
          left: 10,
          top: 2,
          child: Text(
            labelText,
            style: TextStyle(
              color: controller.text.isEmpty ? Colors.black : Colors.blue,
              fontSize: 12,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
      ],
    );
  }
}
