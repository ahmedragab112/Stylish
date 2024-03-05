import 'package:flutter/material.dart';
import 'package:stylehub/features/forgotpassword/presentation/widgets/rest_codebody.dart';

class RestCode extends StatelessWidget {
  const RestCode({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: RestCodeBody()),
          ],
        ),
      ),
    );
  }
}
