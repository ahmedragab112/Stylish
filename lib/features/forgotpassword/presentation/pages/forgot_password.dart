import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylehub/features/forgotpassword/manager/forgotpassword_cubit.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    var bloc = context.read<ForgotPasswordCubit>();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await bloc.forgotPassword(email: 'vvvvvvvvvv1633232002@gmail.com');
        },
        child: const Icon(Icons.send_outlined),
      ),
    );
  }
}
