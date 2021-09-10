enum Gender { Male, Female, Other }

class LoanForm {
  final String? fullName;
  final Gender? gender;
  //final DateTime? dob;
  final String? cnic;
  final String? address;
  final String? phoneNumber;
  final bool? isEmployeed;

  LoanForm({
    required this.fullName,
    required this.gender,
    //required this.dob,
    required this.cnic,
    required this.address,
    required this.phoneNumber,
    required this.isEmployeed,
  });
}
