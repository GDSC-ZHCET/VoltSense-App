class UserModel {
  //keep those values final which ypu do not want to update
  final String id;
  String firstName;
  String lastName;
  final String username;
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

  //convert usermodel to json for firestore
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "firstName": firstName,
      "lastName": lastName,
      "username": username,
      "email": email,
      "phonenumber": phoneNumber,
    };
  }

  //convert firestore document snapshot to usermodel object
  factory UserModel.fromjson(Map<String, dynamic> json) {
    return UserModel(
      id: json["id"] ?? "",
      firstName: json["firstName"] ?? "",
      lastName: json["lastName"] ?? "",
      username: json["username"] ?? "",
      email: json["email"] ?? "",
      phoneNumber: json["phoneNumber"] ?? "",
    );
  }

  ///Helper function to format phone number.
  //String get formattedPhoneNo => VFormatter.formatPhoneNumber(phoneNumber);
}
