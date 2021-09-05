import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit/bloc/user_list_bloc.dart';

class List extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        if (state is UserEmptyState) {
          return Center(
            child: Text(
              'No data received. Press button "Load"',
              style: TextStyle(fontSize: 20.0),
            ),
          );
        }

        if (state is UserLoadingState) {
          return Center(child: CircularProgressIndicator());
        }

        if (state is UserLoadedState) {
          return Container(
            child: ListView.builder(
              itemCount: state.loadedUser.length,
              itemBuilder: (context, index) => Container(
                color: index % 2 == 0 ? Colors.white : Colors.blue[50],
                child: ListTile(
                  leading: Text(
                    'ID: ${state.loadedUser[index].id}',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  title: Column(
                    children: <Widget>[
                      Text(
                        '${state.loadedUser[index].name}',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Username: ${state.loadedUser[index].username}',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                          Text(
                            'Phone: ${state.loadedUser[index].phone}',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }

        if (state is UserErrorState) {
          return Center(
            child: Text(
              'Error fetching users',
              style: TextStyle(fontSize: 20.0),
            ),
          );
        }
        return Container();
      },
    );
  }
}
