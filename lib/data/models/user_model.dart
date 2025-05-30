import '../../domain/entities/user.dart';

class UserModel extends User {
  UserModel({required String email}) : super(email);

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(email: json['email']);
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
    };
  }
}