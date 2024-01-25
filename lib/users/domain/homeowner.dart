class Homeowner {
  final String userId;
  final String firstName;
  final String middleName;
  final String lastName;
  final String email;
  final String accountStatus;
  final String addressBarangay;
  final String addressCity;
  final String addressCountry;
  final String addressProvince;
  final String dateOfBirth;
  final String emergencyContact;
  final String emergencyContactPhoneNumber;
  final String fullAddress;
  final String phoneNumber;
  final String profilePictureURL;
  final String sex;
  final String zipCode;

  static const String undefinedUserId = "UNDEFINED";

  Homeowner({
    required this.userId,
    required this.firstName,
    required this.middleName,
    required this.lastName,
    required this.email,
    required this.accountStatus,
    required this.addressBarangay,
    required this.addressCity,
    required this.addressCountry,
    required this.addressProvince,
    required this.dateOfBirth,
    required this.emergencyContact,
    required this.emergencyContactPhoneNumber,
    required this.fullAddress,
    required this.phoneNumber,
    required this.profilePictureURL,
    required this.sex,
    required this.zipCode,
  });

  factory Homeowner.fromJson(Map<String, dynamic> json) {
    return Homeowner(
      userId: json["userId"],
      firstName: json["firstName"],
      middleName: json["middleName"],
      lastName: json["lastName"],
      email: json["email"],
      accountStatus: json["accountStatus"],
      addressBarangay: json["addressBarangay"],
      addressCity: json["addressCity"],
      addressCountry: json["addressCountry"],
      addressProvince: json["addressProvince"],
      dateOfBirth: json["dateOfBirth"],
      emergencyContact: json["emergencyContact"],
      emergencyContactPhoneNumber: json["emergencyContactPhoneNumber"],
      fullAddress: json["fullAddress"],
      phoneNumber: json["phoneNumber"],
      profilePictureURL: json["profilePictureURL"],
      sex: json["sex"],
      zipCode: json["zipCode"],
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      "userId": userId,
      "firstName": firstName,
      "middleName": middleName,
      "lastName": lastName,
      "email": email,
      "accountStatus": accountStatus,
      "addressBarangay": addressBarangay,
      "addressCity": addressCity,
      "addressCountry": addressCountry,
      "addressProvince": addressProvince,
      "dateOfBirth": dateOfBirth,
      "emergencyContact": emergencyContact,
      "emergencyContactPhoneNumber": emergencyContactPhoneNumber,
      "fullAddress": fullAddress,
      "phoneNumber": phoneNumber,
      "profilePictureURL": profilePictureURL,
      "sex": sex,
      "zipCode": zipCode,
    };
  }

  Map<String, dynamic> toUserJson() {
    var userType = "Homeowner";
    return <String, dynamic>{
      "email": email,
      "type": userType,
      "userId": userId,
    };
  }

  String get fullName => '$firstName ${middleName[0]} $lastName';

  Homeowner copyWith({
    String? userId,
    String? firstName,
    String? middleName,
    String? lastName,
    String? email,
    String? accountStatus,
    String? addressBarangay,
    String? addressCity,
    String? addressCountry,
    String? addressProvince,
    String? dateOfBirth,
    String? emergencyContact,
    String? emergencyContactPhoneNumber,
    String? fullAddress,
    String? phoneNumber,
    String? profilePictureURL,
    String? sex,
    String? zipCode,
  }) {
    return Homeowner(
      userId: userId ?? this.userId,
      firstName: firstName ?? this.firstName,
      middleName: middleName ?? this.middleName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      accountStatus: accountStatus ?? this.accountStatus,
      addressBarangay: addressBarangay ?? this.addressBarangay,
      addressCity: addressCity ?? this.addressCity,
      addressCountry: addressCountry ?? this.addressCountry,
      addressProvince: addressProvince ?? this.addressProvince,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      emergencyContact: emergencyContact ?? this.emergencyContact,
      emergencyContactPhoneNumber:
          emergencyContactPhoneNumber ?? this.emergencyContactPhoneNumber,
      fullAddress: fullAddress ?? this.fullAddress,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      profilePictureURL: profilePictureURL ?? this.profilePictureURL,
      sex: sex ?? this.sex,
      zipCode: zipCode ?? this.zipCode,
    );
  }
}
