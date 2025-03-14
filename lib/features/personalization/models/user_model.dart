import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  //keep those values final which ypu do not want to update
  final String id;
  String firstName;
  String lastName;
  String username;
  final String email;
  String phoneNumber;

  ///constructor for UserModel
  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.email,
    required this.phoneNumber,
  });

  ///Helper function to get the full name,
  String get fullName => '$firstName $lastName';

  //Static function to generate a username from the full name.
  static List<String> nameparts(fullName) => fullName.split(" ");

  //Static function to generate a username from the full name.
  static String generateUsername(fullName) {
    List<String> nameParts = fullName.split(" ");
    String firstName = nameParts[0].toLowerCase();
    String lastName = nameParts.length > 1 ? nameParts[1].toLowerCase() : "";

    String camelCaseUsername = "$firstName$lastName";
    String usernameWithPrefix = "cwt_$camelCaseUsername";
    return usernameWithPrefix;
  }

  //Static function to create an empty user model.
  static UserModel empty() => UserModel(
      id: '',
      firstName: '',
      lastName: '',
      username: '',
      email: '',
      phoneNumber: '');

  //convert usermodel to json for firestore
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "FirstName": firstName,
      "LastName": lastName,
      "Username": username,
      "Email": email,
      "Phonenumber": phoneNumber,
    };
  }

  //factory method to create a userModel from a Firebase document snapshot.
  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return UserModel(
        id: document.id,
        firstName: data['firstName'] ?? '',
        lastName: data['lastName'] ?? '',
        username: data['username'] ?? '',
        email: data['email'] ?? '',
        phoneNumber: data['phonenumber'] ?? '',
      );
    } else {
      return UserModel.empty();
    }
  }

  //convert firestore document snapshot to usermodel object
  factory UserModel.fromjson(Map<String, dynamic> json) {
    return UserModel(
      id: json["id"] ?? "",
      firstName: json["firstName"] ?? "",
      lastName: json["lastName"] ?? "",
      username: json["username"] ?? "",
      email: json["email"] ?? "",
      phoneNumber: json["phonenumber"] ?? "",
    );
  }

  ///Helper function to format phone number.
  //String get formattedPhoneNo => VFormatter.formatPhoneNumber(phoneNumber);
}
