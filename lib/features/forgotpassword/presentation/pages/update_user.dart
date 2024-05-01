import 'package:flutter/material.dart';
import 'package:stylehub/features/forgotpassword/presentation/widgets/update_user_passsword_body.dart';

class UpdateUserPassword extends StatelessWidget {
  const UpdateUserPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: UpdateUserPasswordBody(),
            ), 
          
          ],
        ),
      ),
    );
  }
}
