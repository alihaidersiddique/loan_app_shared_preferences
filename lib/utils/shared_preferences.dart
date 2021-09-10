import 'package:loan_application_shared_preferences/models/model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FormPreferences {
  //
  Future saveData(LoanForm loanForm) async {
    final _preferences = await SharedPreferences.getInstance();

    await _preferences.setString('fullName', loanForm.fullName ?? '');
    await _preferences.setInt('gender', loanForm.gender!.index);
    //await _preferences.setString('dob', loanForm.dob.toString());
    await _preferences.setString('cnic', loanForm.cnic ?? '');
    await _preferences.setString('address', loanForm.address ?? '');
    await _preferences.setString('phone', loanForm.phoneNumber ?? '');
    await _preferences.setBool('isEmployeed', loanForm.isEmployeed ?? false);

    print('data saved !');
  }

  Future<LoanForm> getData() async {
    final _preferences = await SharedPreferences.getInstance();

    final fullName = _preferences.getString('fullName');
    final gender = Gender.values[_preferences.getInt('gender') ?? 0];
    //final dob = _preferences.getString('dob');
    final cnic = _preferences.getString('cnic');
    final address = _preferences.getString('address');
    final phoneNumber = _preferences.getString('phone');
    final isEmployeed = _preferences.getBool('isEmployeed');

    return LoanForm(
        fullName: fullName,
        gender: gender,
        //dob: dob,
        cnic: cnic,
        address: address,
        phoneNumber: phoneNumber,
        isEmployeed: isEmployeed);
  }
}
