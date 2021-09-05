import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit/model/user_model.dart';
import 'package:flutter_cubit/repository/user_repository.dart';

class UserCubit extends Cubit<UserState> {
  final UsersRepository usersRepository;

  UserCubit(this.usersRepository) : super(UserEmptyState());

  Future<void> fetchUsers() async {
    try {
      emit(UserLoadingState());
      final List<UserModel> _loadedUserList =
          await usersRepository.getAllUsers();

      print(_loadedUserList);
      emit(UserLoadedState(loadedUser: _loadedUserList));
    } catch (_) {
      emit(UserErrorState());
    }
  }

  Future<void> clearUsers() async {
    emit(UserEmptyState());
  }
}

abstract class UserState {}

class UserEmptyState extends UserState {}

class UserLoadingState extends UserState {}

class UserLoadedState extends UserState {
  List<dynamic> loadedUser;

  UserLoadedState({required this.loadedUser}) : assert(loadedUser != null);
}

class UserErrorState extends UserState {}
