import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylehub/features/login/data/model/login_data.dart';
import 'package:stylehub/features/login/presentation/manager/login_cubit.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<LoginCubit, LoginState>(
        builder: (context, state) {
          if (state is LoginError) {
            return Center(
              child: Text(state.message),
            );
          } else if (state is LoginSuccess) {
            return Center(
              child: Text(state.userEntity.token!),
            );
          } else {
            return const Center(
              child: Text('not logged in preess floating to login'),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await context.read<LoginCubit>().login(
              loginData: LoginData(
                  email: "ahmedragab12322@gmail.com", password: "Ahmed@123"));
        },
      ),
    );
  }
}
