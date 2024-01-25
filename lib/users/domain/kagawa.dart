import 'package:app/users/domain/homeowner.dart';

class Kagawa extends Homeowner {
  final experiences;
  final reviews;
  final bookings;
  final pictures;
  final schedule;
  final credentials;
  final plumbing_works;
  Kagawa(this.experiences, this.reviews, this.bookings, this.pictures,
      this.schedule, this.credentials, this.plumbing_works,
      {required super.userId,
      required super.firstName,
      required super.middleName,
      required super.lastName,
      required super.email,
      required super.accountStatus,
      required super.addressBarangay,
      required super.addressCity,
      required super.addressCountry,
      required super.addressProvince,
      required super.dateOfBirth,
      required super.emergencyContact,
      required super.emergencyContactPhoneNumber,
      required super.fullAddress,
      required super.phoneNumber,
      required super.profilePictureURL,
      required super.sex,
      required super.zipCode});
}
