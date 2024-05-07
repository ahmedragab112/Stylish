
import 'package:flutter/material.dart';

import 'package:stylehub/core/utils/animation/shimmer_effect.dart';
import 'package:stylehub/core/utils/layout/app_layout.dart';
import 'package:stylehub/core/utils/spaceing/spaceing.dart';

class LoadingEffect extends StatelessWidget {
  const LoadingEffect({super.key});

  @override
  Widget build(BuildContext context) {
    return ShimmerEffect(
      width: context.screenWidth(),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(.1),
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
          const HorizantelSpace(30),
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ShimmerEffect(
                    width: double.infinity,
                    child: Container(
                      height: 10,
                      color: Colors.grey.withOpacity(.1),
                    )),
                const VerticalSpace(10),
                ShimmerEffect(
                    width: context.screenWidth() * .5,
                    child: Container(
                      height: 10,
                      color: Colors.grey.withOpacity(.1),
                    )),
                const VerticalSpace(10),
                ShimmerEffect(
                    width: context.screenWidth() * .3,
                    child: Container(
                      height: 10,
                      color: Colors.grey.withOpacity(.1),
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
