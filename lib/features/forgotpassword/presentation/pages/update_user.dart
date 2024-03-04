import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylehub/features/forgotpassword/manager/forgotpassword_cubit.dart';

class UpdateUserPassword extends StatelessWidget {
  const UpdateUserPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        context.read<ForgotPasswordCubit>().resetPassword();
      }, child: Icon(Icons.add),),
    );
  }
}