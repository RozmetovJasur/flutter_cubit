import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit/bloc/user_list_bloc.dart';

class Buttons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final UserCubit userCubit = BlocProvider.of<UserCubit>(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        ElevatedButton(
          child: Text('Load'),
          onPressed: () {
            userCubit.fetchUsers();
          },
        ),
        SizedBox(width: 8.0),
        ElevatedButton(
          child: Text('Clear'),
          onPressed: () {
            userCubit.clearUsers();
          },
        ),
      ],
    );
  }
}
