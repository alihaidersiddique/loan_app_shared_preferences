import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loan_application_shared_preferences/models/model.dart';
import 'package:loan_application_shared_preferences/utils/shared_preferences.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _grabFullName = TextEditingController();
  final _grabCNIC = TextEditingController();
  final _grabAddress = TextEditingController();
  final _grabPhone = TextEditingController();
  var _isEmployeed = false;
  var _selectedSex = Gender.Male;
  DateTime _date = DateTime.now();
  final prefObj = FormPreferences();

  @override
  void initState() {
    super.initState();
    _populateLoanApplication();
  }

  Future<void> _populateLoanApplication() async {
    final obj = await prefObj.getData();

    setState(() {
      _grabAddress.text = obj.address ?? '';
      _grabCNIC.text = obj.cnic ?? '';
      _grabFullName.text = obj.fullName ?? '';
      _grabPhone.text = obj.phoneNumber ?? '';
      _isEmployeed = obj.isEmployeed ?? false;
      _selectedSex = obj.gender ?? Gender.Other;
      //_date = obj.dob ?? DateTime.now();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Loan Application'),
      ),
      body: ListView(
        children: [
          SizedBox(height: 24),
          ListTile(
            title: TextField(
              controller: _grabFullName,
              decoration: InputDecoration(
                labelText: 'Full Name',
              ),
            ),
          ),
          SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Text(
              'Gender',
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
          ),
          RadioListTile(
            title: Text('Male'),
            value: Gender.Male,
            groupValue: _selectedSex,
            onChanged: (newGender) =>
                setState(() => _selectedSex = newGender as Gender),
          ),
          RadioListTile(
            title: Text('Female'),
            value: Gender.Female,
            groupValue: _selectedSex,
            onChanged: (newGender) =>
                setState(() => _selectedSex = newGender as Gender),
          ),
          // SizedBox(height: 15),
          // Padding(
          //   padding: const EdgeInsets.only(left: 15.0, bottom: 10),
          //   child: Text(
          //     'Date of Birth',
          //     style: TextStyle(color: Theme.of(context).primaryColor),
          //   ),
          // ),
          // SizedBox(
          //   height: 35,
          //   child: CupertinoDatePicker(
          //     initialDateTime: _date,
          //     mode: CupertinoDatePickerMode.date,
          //     onDateTimeChanged: (date) => setState(() => _date = date),
          //   ),
          // ),
          SizedBox(height: 15),
          ListTile(
            title: TextField(
              controller: _grabCNIC,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'CNIC',
              ),
            ),
          ),
          SizedBox(height: 15),
          ListTile(
            title: TextField(
              controller: _grabAddress,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Residential Address',
              ),
            ),
          ),
          SizedBox(height: 15),
          ListTile(
            leading: Icon(
              Icons.phone,
              size: 30,
            ),
            title: TextField(
              controller: _grabPhone,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter Phone Number',
              ),
            ),
          ),
          SizedBox(height: 15),
          SwitchListTile(
            title: Text('Is Employeed'),
            value: _isEmployeed,
            onChanged: (status) {
              if (status == true) {
                setState(
                  () {
                    _isEmployeed = status;
                    ListTile(
                      title: TextField(
                        decoration:
                            InputDecoration(labelText: 'Monthly Salary'),
                      ),
                    );
                  },
                );
              }
            },
          ),
          SizedBox(height: 15),
          ListTile(
            title: ElevatedButton(
              onPressed: _saveSettings,
              child: Text('Save'),
            ),
          )
        ],
      ),
    );
  }

  void _saveSettings() {
    //
    final savedForm = LoanForm(
        fullName: _grabFullName.text,
        gender: _selectedSex,
        //dob: _date,
        cnic: _grabCNIC.text,
        address: _grabAddress.text,
        phoneNumber: _grabPhone.text,
        isEmployeed: _isEmployeed);

    prefObj.saveData(savedForm);
  }
}
