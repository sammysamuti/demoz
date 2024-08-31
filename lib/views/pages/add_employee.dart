import 'package:flutter/material.dart';

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
              'Add Employee',
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
                        'Add New ',
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        'Employee',
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
                    'Here you add your new employee and start calculating his tax and salary',
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                        fontWeight: FontWeight.w300),
                  ),
                  SizedBox(height: 30),
                  _buildTextField(_employeeNameController, 'Employee name'),
                  SizedBox(height: 16),
                  _buildTextField(_emailAddressController, 'Email address'),
                  SizedBox(height: 16),
                  _buildTextField(_phoneNumberController, 'Phone number'),
                  SizedBox(height: 16),
                  _buildTextField(_tinNumberController, 'Tin number'),
                  SizedBox(height: 16),
                  _buildTextField(_grossSalaryController, 'Gross salary'),
                  SizedBox(height: 16),
                  _buildTextField(
                      _taxableEarningsController, 'Taxable earnings'),
                  SizedBox(height: 16),
                  _buildTextField(
                      _startingDateController, 'Starting date of salary'),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildToggleButton('per month', _isPerMonthSelected),
                      SizedBox(width: 10),
                      _buildToggleButton('per Contract', !_isPerMonthSelected),
                    ],
                  ),
                  SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: _isFormValid
                        ? () {
                            if (_formKey.currentState!.validate()) {
                             
                            }
                          }
                        : null,
                    child: Center(
                      child: Text(
                        'Add employee',
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
          _toggleSelection(text == 'per month');
        },
        child: Container(
          height: 40, 
          decoration: BoxDecoration(
            color: isSelected
                ? Colors.lightBlue[100]
                : Colors.grey[200], 
            borderRadius:
                BorderRadius.circular(8), 
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
