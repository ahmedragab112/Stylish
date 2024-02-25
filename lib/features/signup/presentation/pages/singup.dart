import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylehub/features/signup/presentation/cubit/signup_cubit.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<SignupCubit, SignupState>(
        builder: (context, state) {
          if (state is SignupError) {
            return Center(child: Text(state.message));
          } else if (state is SignupSuccess) {
            return Center(child: Text(state.userEntity.token??' no token '));
          } else {
            return Center(child: Text('SignUp'));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(onPressed: () async {
        await context.read<SignupCubit>().signUp();
      }),
    );
  }
}
