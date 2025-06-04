import 'package:expense_app_bloc/core/local/db_helper.dart';

class UserModel{
  final int? userId;
  final String userName;
  final String email;
  final String userMobileNumber;
  final String userPassword;

  UserModel({
    this.userId,
    required this.userName,
    required this.email,
    required this.userMobileNumber,
    required this.userPassword,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userId: json[DBHelper.columnUserId] as int?,
      userName: json[DBHelper.columnUserName] as String,
      email: json[DBHelper.columnUserEmail] as String,
      userMobileNumber: json[DBHelper.columnUserMobileNumber] as String,
      userPassword: json[DBHelper.columnUserPassword] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      DBHelper.columnUserName: userName,
      DBHelper.columnUserEmail: email,
      DBHelper.columnUserMobileNumber: userMobileNumber,
      DBHelper.columnUserPassword: userPassword, // Assuming you want to store password too
    };
  }
}