import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddEmployeePage extends StatefulWidget {
  static String route = 'addnewemployee-page';

  @override
  _AddEmployeePageState createState() => _AddEmployeePageState();
}

class _AddEmployeePageState extends State<AddEmployeePage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _employeeNameController = TextEditingController();
  final TextEditingController _emailAddressController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _tinNumberController = TextEditingController();
  final TextEditingController _grossSalaryController = TextEditingController();
  final TextEditingController _taxableEarningsController =
      TextEditingController();
  final TextEditingController _startingDateController = TextEditingController();

  bool _isPerMonthSelected = true;

  @override
  void initState() {
    super.initState();
    _employeeNameController.addListener(_updateFormState);
    _emailAddressController.addListener(_updateFormState);
    _phoneNumberController.addListener(_updateFormState);
    _tinNumberController.addListener(_updateFormState);
    _grossSalaryController.addListener(_updateFormState);
    _taxableEarningsController.addListener(_updateFormState);
    _startingDateController.addListener(_updateFormState);
  }

  void _updateFormState() {
    setState(() {});
  }

  @override
  void dispose() {
    _employeeNameController.dispose();
    _emailAddressController.dispose();
    _phoneNumberController.dispose();
    _tinNumberController.dispose();
    _grossSalaryController.dispose();
    _taxableEarningsController.dispose();
    _startingDateController.dispose();
    super.dispose();
  }

  bool get _isFormValid {
    return _formKey.currentState?.validate() ?? false;
  }

  void _toggleSelection(bool isPerMonth) {
    setState(() {
      _isPerMonthSelected = isPerMonth;
    });
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
        actions: <Widget>[
          TextButton(
            onPressed: _isFormValid ? () {} : null,
            child: Text(
              AppLocalizations.of(context)!.addEmployee,
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.addNew,
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(width: 5),
                      Text(
                        AppLocalizations.of(context)!.employee,
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w500,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text(
                    AppLocalizations.of(context)!.here,
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                        fontWeight: FontWeight.w300),
                  ),
                  SizedBox(height: 30),
                  _buildTextField(_employeeNameController,
                      AppLocalizations.of(context)!.employeeName),
                  SizedBox(height: 16),
                  _buildTextField(_emailAddressController,
                      AppLocalizations.of(context)!.employeeAddress),
                  SizedBox(height: 16),
                  _buildTextField(_phoneNumberController,
                      AppLocalizations.of(context)!.phoneNumber),
                  SizedBox(height: 16),
                  _buildTextField(_tinNumberController,
                      AppLocalizations.of(context)!.tinNumber),
                  SizedBox(height: 16),
                  _buildTextField(_grossSalaryController,
                      AppLocalizations.of(context)!.grossSalary),
                  SizedBox(height: 16),
                  _buildTextField(_taxableEarningsController,
                      AppLocalizations.of(context)!.taxableEarnings),
                  SizedBox(height: 16),
                  _buildTextField(_startingDateController,
                      AppLocalizations.of(context)!.startingDateOfSalary),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildToggleButton(AppLocalizations.of(context)!.perMonth,
                          _isPerMonthSelected),
                      SizedBox(width: 10),
                      _buildToggleButton(
                          AppLocalizations.of(context)!.perContract,
                          !_isPerMonthSelected),
                    ],
                  ),
                  SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: _isFormValid
                        ? () {
                            if (_formKey.currentState!.validate()) {}
                          }
                        : null,
                    child: Center(
                      child: Text(
                        AppLocalizations.of(context)!.addEmployee,
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
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String labelText) {
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
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'This field is required';
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

  Widget _buildToggleButton(String text, bool isSelected) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          _toggleSelection(text == AppLocalizations.of(context)!.perMonth);
        },
        child: Container(
          height: 40,
          decoration: BoxDecoration(
            color: isSelected ? Colors.lightBlue[100] : Colors.grey[200],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
