import 'package:flutter/material.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/fonts.dart';

class BalanceWidget extends StatelessWidget {
  const BalanceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.black45,
        ),
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Row(
            children: [
              Column(
                children: [
                  Text(
                    'Your Balance',
                    style: AppFont.font18BoldWhite,
                  ),
                  verticalSpace(5),
                  Text(
                    '1000 EGP',
                    style: AppFont.font28SemiBoldWhite,
                  )
                ],
              ),
              Spacer(),
              CircleAvatar(
                child: IconButton(
                  onPressed: (){},
                  icon: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
                backgroundColor: Colors.cyan,
              )
            ],
          ),
        ),
      ),
    );
  }
}
