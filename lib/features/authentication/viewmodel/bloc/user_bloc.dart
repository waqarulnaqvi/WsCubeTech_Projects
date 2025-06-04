import 'package:expense_app_bloc/core/local/db_helper.dart';
import 'package:expense_app_bloc/core/models/user_model.dart';
import 'package:expense_app_bloc/features/authentication/viewmodel/bloc/user_event.dart';
import 'package:expense_app_bloc/features/authentication/viewmodel/bloc/user_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  DBHelper dbHelper;

  UserBloc({required this.dbHelper}) : super(UserInitialState()) {
    on<RegisterUserEvent>((event, emit) async {
      emit(UserLoadingState());

      bool isOldUser =
          await dbHelper.checkIfUserAlreadyExists(email: event.newUser.email);
      if (!isOldUser) {
        bool check = await dbHelper.createUser(user: event.newUser);
        if (check) {
          emit(UserSuccessState());
        } else {
          emit(UserFailureState(error: "Failed to create user"));
        }
      } else {
        emit(UserFailureState(error: "User already exists with this email"));
      }
    });

    on<LoginUserEvent>((event, emit) async {
      emit(UserLoadingState());
      bool isUser = await dbHelper.checkIfUserAlreadyExists(email: event.email);
      print("Is user exists: $isUser");

      if (isUser) {
        UserModel? user = await dbHelper.authenticateUser(
            email: event.email, password: event.password);
        print("User authenticated: $user");
        if (user != null) {
          emit(UserLoggedInState(user: user));
        } else {
          emit(UserFailureState(error: "Invalid email or password"));
        }
      }
      else {
        emit(UserFailureState(error: "User does not exist with this email"));
      }
    });
  }
}
