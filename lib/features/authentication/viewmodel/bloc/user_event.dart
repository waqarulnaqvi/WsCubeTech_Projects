import 'package:expense_app_bloc/core/models/user_model.dart';

abstract class UserEvent {}

class RegisterUserEvent extends UserEvent {
  UserModel newUser;

  RegisterUserEvent({required this.newUser});
}

class LoginUserEvent extends UserEvent {
  String email;
  String password;

  LoginUserEvent({required this.email, required this.password});
}

class UserLogoutEvent extends UserEvent {
  // This event can be used to handle user logout if needed
}

class UserLoginSuccessEvent extends UserEvent {
  // This event can be used to handle successful login actions if needed
}
