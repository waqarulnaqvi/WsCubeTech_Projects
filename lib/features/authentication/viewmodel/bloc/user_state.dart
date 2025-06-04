import '../../../../core/models/user_model.dart';

abstract class UserState {}

class UserInitialState extends UserState {}

class UserLoadingState extends UserState {}

class UserSuccessState extends UserState {

  UserSuccessState();
}

class UserLoggedInState extends UserState {
  final UserModel user;

  UserLoggedInState({required this.user});
}

class UserFailureState extends UserState {
  final String error;

  UserFailureState({required this.error});
}
