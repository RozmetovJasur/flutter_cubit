import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit/bloc/user_list_bloc.dart';
import 'package:flutter_cubit/repository/user_repository.dart';
import 'package:flutter_cubit/ui/users/buttons.dart';
import 'package:flutter_cubit/ui/users/list.dart';

class HomePage extends StatelessWidget {
  final usersRepository = UsersRepository();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserCubit>(
      create: (context) => UserCubit(usersRepository),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Flutter bloc cubit"),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[Buttons(), Expanded(child: List())],
        ),
      ),
    );
  }
}
