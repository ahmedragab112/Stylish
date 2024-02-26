import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylehub/config/router/routes.dart';
import 'package:stylehub/core/extentions/extention.dart';
import 'package:stylehub/features/signup/presentation/cubit/signup_cubit.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<SignupCubit, SignupState>(
            builder: (context, state) {
              if (state is SignupError) {
                return Center(child: Text(state.message));
              } else if (state is SignupSuccess) {
                return Center(
                    child: Text(state.userEntity.token ?? ' no token '));
              } else {
                return const Center(child: Text('SignUp'));
              }
            },
          ),
          ElevatedButton(
            onPressed: () {
              context.pushReplacementNamed(AppRoutes.signIn);
            },
            child: const Text('go to login'),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: () async {
        await context.read<SignupCubit>().signUp();
      }),
    );
  }
}
