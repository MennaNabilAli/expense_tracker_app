import 'package:expense_tracker/features/home/ui/widgets/percents_widget.dart';
import 'package:flutter/material.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/fonts.dart';
import 'balance_widget.dart';
import 'my_app_bar.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            verticalSpace(10),
            MyAppBar(),
            verticalSpace(10),
            BalanceWidget(),
            verticalSpace(15),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Top Transactions',
                  style: AppFont.font18BoldWhite,
                ),
              ),
            ),
            PercentsWidget(),
            verticalSpace(10),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Latest Transactions',
                  style: AppFont.font18BoldWhite,
                ),
              ),
            ),
            verticalSpace(20),
            SizedBox(
                height: 500,
                child: ListView(
                  children: [
                    Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.black26,
                                borderRadius: BorderRadius.circular(20)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Row(
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Electricity',
                                        style: AppFont.font18BoldWhite,
                                      ),
                                      verticalSpace(7),
                                      Text(
                                        '2 June,2024',
                                        style: AppFont.font13GreyW300,
                                      ),

                                    ],
                                  ),
                                  Spacer(),
                                  Text(
                                    '-200 EGP',
                                    style: AppFont.font18BoldWhite,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 0,
                          bottom: 0,
                          right: 0,
                          child: Container(
                            height: double.infinity,
                            width: 25,
                            decoration: BoxDecoration(
                                color: AppColors.orangeColor,
                                borderRadius: BorderRadius.only(topRight: Radius.circular(16),bottomRight: Radius.circular(16))
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                )
            )
          ],
        ),
      ),
    );
  }
}
